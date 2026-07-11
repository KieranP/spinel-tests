# frozen_string_literal: true

require 'timeout'

require_relative 'errors'

module SpinelCheck
  # Runs one file under one toolchain, under a wall clock and the memory guard.
  class Runner
    # How long to let the pipes empty after the process group has been killed.
    DRAIN_GRACE = 2
    # What a single `ruby` / `spinel` invocation produced.
    #
    # `stdout` is byte-faithful program output — EXCEPT when the run was killed, where it
    # is replaced by a marker. That is deliberate: a SIGKILLed group's output is a truncated
    # prefix and must never be compared as if it were the program's, and the marker cannot
    # match real output, so a killed run can never read as a pass.
    Result = Data.define(:stdout, :stderr, :peak_mb, :outcome) do
      def ok?            = outcome == :ok
      def timed_out?     = outcome == :timeout
      def memory_killed? = %i[memory_job memory_total].include?(outcome)
    end

    def initialize(config:, guard:)
      @config = config
      @guard  = guard
    end

    def ruby(path) = run('ruby', path)

    def spinel(path)
      # Checked once, before the first of possibly thousands of doomed spawns, so a wrong
      # path is one clear line instead of a backtrace per file.
      @spinel_ok ||= check_executable(@config.spinel)
      run(@config.spinel, '-E', path)
    end

    # Captures stdout and stderr SEPARATELY. The value compare never folds stderr into
    # stdout (`2>&1` would yield false DIFFs), but stderr is kept so Diagnostic can
    # classify Spinel's compile-time output.
    def run(*command)
      # The run is being torn down (Ctrl-C); starting another child here is what turned an
      # interrupted sweep into MORE orphans than it had children.
      raise Interrupt if @guard.stopped?

      out_read, out_write = IO.pipe
      err_read, err_write = IO.pipe

      # stdin MUST be /dev/null, never inherited: a script that reads stdin (`gets`,
      # `$stdin.read`, `ARGF`) would otherwise block on the parent's terminal until the
      # timeout, reporting a bogus TIMEOUT — and under a `find | xargs` parent it would
      # swallow the pipe carrying the remaining file list, starving the whole sweep. Both
      # sides get the same empty stdin, so `gets` -> nil compares faithfully.
      pid = spawn_child(command, out_write, err_write)
      # `pgroup: true` makes the child a group leader, so its pgid IS its pid. Remember it
      # now: once the child is reaped Process.getpgid(pid) raises ESRCH, and a group sweep
      # that silently rescued into a no-op would leave the survivors running.
      pgid  = pid
      token = @guard.watch(pgid) # from here on the guard may KILL this group
      out_write.close
      err_write.close

      stdout = +''
      stderr = +''
      readers = [reader(out_read, stdout), reader(err_read, stderr)]

      timed_out = wait_for(pid, pgid)
      # `read` returns only when EVERY writer has closed the pipe — and `spinel -E` runs the
      # C binary it just built as a child, which inherits these handles. If that binary
      # outlives spinel, the reader threads block forever even though the wait already
      # returned and no timeout fired. So sweep the whole group once the direct child is
      # reaped: normally there is nothing left to signal, and on a hang it frees the pipe.
      kill_group(pgid)
      drained = drain(readers, out_read, err_read)

      build(stdout, stderr, @guard.release(token), timed_out, drained)
    ensure
      # ALL four ends, not just the read ends: if the spawn raises — a missing or
      # non-executable toolchain — the write ends were never closed, and over a
      # thousands-of-files sweep that leaks two descriptors per file until the process dies
      # of EMFILE, far from the actual cause.
      [out_read, out_write, err_read, err_write].each { |io| io.close unless io.nil? || io.closed? }
    end

    private

    def reader(io, sink)
      Thread.new do
        sink << io.read
      rescue IOError
        # Expected: `drain` force-closed our end to break out of a wait that would never
        # finish. Whatever had already arrived is in `sink`, and the run is marked undrained.
        # Handled HERE rather than at the join, because `Thread#join` re-raises.
        nil
      end
    end

    # Wait for the pipes to empty, but never unboundedly.
    #
    # Killing the process group frees the pipe for every normal case, including the compiled
    # binary spinel leaves running. It does NOT free it for a writer that left the group
    # (setsid) — and an unbounded join there hangs the harness forever, past its own wall
    # clock, which is exactly what a tool built for unattended runs must not do. So: a short
    # grace period, then force EOF by closing our ends.
    #
    # Returns false when the pipes had to be forced, so the caller can refuse to treat a
    # partial capture as output.
    def drain(readers, *pipes)
      readers.each { |thread| thread.join(DRAIN_GRACE) }
      return true if readers.none?(&:alive?)

      pipes.each { |io| io.close unless io.closed? }
      readers.each { |thread| thread.join(DRAIN_GRACE) || thread.kill }
      false
    end

    def spawn_child(command, out_write, err_write)
      Process.spawn(*command, in: File::NULL, out: out_write, err: err_write, pgroup: true)
    rescue Errno::ENOENT, Errno::EACCES, Errno::ENOTDIR => e
      raise Error, "cannot run #{command.first}: #{e.message}"
    end

    def check_executable(path)
      raise Error, "spinel not found at #{path} — set SPINEL_BIN to its location" unless File.exist?(path)
      raise Error, "spinel at #{path} is not executable" unless File.executable?(path)

      true
    end

    def wait_for(pid, pgid)
      Timeout.timeout(@config.timeout) { Process.wait(pid) }
      false
    rescue Timeout::Error
      kill_group(pgid)
      begin
        Process.wait(pid)
      rescue StandardError
        nil
      end
      true
    end

    def kill_group(pgid)
      Process.kill('-KILL', pgid)
    rescue StandardError
      nil
    end

    def build(stdout, stderr, usage, timed_out, drained)
      outcome =
        case usage.exceeded
        when :job   then :memory_job
        when :total then :memory_total
        else timed_out || !drained ? :timeout : :ok
        end

      # Spinel's C compiler can emit non-UTF-8 bytes on stderr (a source snippet in a
      # foreign encoding echoed inside a gcc diagnostic). stderr is only ever regex-scanned
      # or printed, never value-compared, so scrub it — otherwise Diagnostic's match raises
      # ArgumentError and takes the whole run down. stdout is left as raw bytes: the value
      # compare is `==` (encoding-agnostic) and must stay byte-faithful.
      Result.new(
        stdout: marker_for(outcome, usage, drained) || stdout,
        stderr: stderr.scrub,
        peak_mb: usage.peak_mb,
        outcome: outcome
      )
    end

    def marker_for(outcome, usage, drained = true)
      case outcome
      when :timeout
        drained ? "[TIMEOUT after #{@config.timeout}s]\n" : "[TIMEOUT: output pipe still held after the process group was killed]\n"
      when :memory_job   then "[MEMORY killed: #{usage.peak_mb}MB > SPINEL_MAXRSS #{@config.max_rss}MB]\n"
      when :memory_total then "[MEMORY killed: sweep total > SPINEL_MAXRSS_TOTAL " \
                              "#{@config.max_rss_total}MB (this job #{usage.peak_mb}MB)]\n"
      end
    end
  end
end
