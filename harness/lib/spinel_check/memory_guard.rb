# frozen_string_literal: true

module SpinelCheck
  # Keeps a sweep from taking the machine down.
  #
  # A wall clock alone is NOT enough: a single runaway compile can eat every page of RAM in
  # a few seconds, and long before the timeout fires the machine is swapping and the whole
  # OS is wedged (this happened — a `triage` run froze the box).
  #
  # macOS cannot enforce this on the child itself: setrlimit(RLIMIT_AS/RLIMIT_DATA) returns
  # EINVAL on Darwin, so `ulimit -v` and Process.spawn(rlimit_as:) are both unavailable.
  # So it is policed from outside — ONE thread samples `ps` and kills any child process
  # GROUP whose resident set crosses the per-job cap, plus a whole-sweep ceiling in case
  # several jobs bloat at once. A killed job is reported as MEMORY: a failure, never a pass.
  #
  # One thread for all jobs, rather than one `ps` per job per tick: at N jobs and a 0.3s
  # poll that would be a steady fork storm — and forking is exactly what starts failing
  # when memory runs short.
  class MemoryGuard
    # What a finished job cost. `exceeded` is nil, :job (blew its own cap) or :total (was
    # killed to bring the sweep back under the ceiling — possibly just unlucky, so a :total
    # victim is worth rechecking on its own).
    Usage = Data.define(:peak_mb, :exceeded) do
      def killed? = !exceeded.nil?
    end

    NOT_WATCHED = Usage.new(peak_mb: 0, exceeded: nil)

    # How long to wait between teardown passes, for jobs already past the `stopped?` check.
    GRACE = 0.1

    def initialize(per_job_mb:, total_mb:, poll:)
      @per_job_mb = per_job_mb
      @total_mb   = total_mb
      @poll       = poll
      @jobs       = {} # token => { pgid:, peak:, current:, exceeded: }
      @next_token = 0
      @mutex      = Mutex.new
      @monitor    = nil
    end

    # Each watched entry is a process GROUP, so a job's usage includes everything spinel
    # forks — cc/clang, and the compiled binary spinel runs — which is where the growth
    # actually happens.
    #
    # Returns an opaque token to release with. The registry is NOT keyed by pgid: a pgid is a
    # pid, and the kernel may hand the same one to a new job in the window between reaping
    # this child and releasing it — where a pgid key would let one job's release delete
    # another job's entry, silently leaving that job uncapped.
    def watch(pgid)
      @mutex.synchronize do
        token = (@next_token += 1)
        @jobs[token] = { pgid: pgid, peak: 0, current: 0, exceeded: nil }
        @monitor ||= start_monitor
        token
      end
    end

    def release(token)
      job = @mutex.synchronize { @jobs.delete(token) }
      job ? Usage.new(peak_mb: job[:peak], exceeded: job[:exceeded]) : NOT_WATCHED
    end

    # Tear the run down: refuse new jobs, then kill every group still running.
    #
    # Each job is deliberately in its OWN process group, which means a Ctrl-C at the terminal
    # reaches only this process — every spinel and every compiled binary it spawned survives
    # as an orphan, still burning CPU and skewing whatever runs next. This registry knows
    # their pgids, so it is the only thing that can clean them up.
    #
    # Killing is not enough on its own: the worker threads are still running and will keep
    # spawning fresh jobs while the process unwinds, so an interrupted sweep ended up with
    # MORE orphans than it had children. Hence `@stopped` — checked before each spawn — and a
    # second pass for anything that had already cleared the check.
    def stop!
      @mutex.synchronize { @stopped = true }
      kill_all
      sleep GRACE
      kill_all
    end

    def stopped? = @mutex.synchronize { @stopped }

    def kill_all = live_pgids.each { |pgid| kill_group(pgid) }

    # The process groups still registered. Snapshotted under the lock, so a job finishing
    # mid-sweep cannot mutate the list being iterated.
    def live_pgids = @mutex.synchronize { @jobs.each_value.map { |job| job[:pgid] } }

    private

    def start_monitor
      Thread.new { monitor_loop }.tap { |t| t.name = 'spinel-check memory guard' }
    end

    def monitor_loop
      loop do
        sleep @poll
        next if @mutex.synchronize { @jobs.empty? }

        sample = rss_kb_by_pgid or next
        # Kill outside the lock: signalling can block, and release() must not wait on it.
        @mutex.synchronize { record(sample) }.each { |pgid| kill_group(pgid) }
      end
    end

    # Enforces both ceilings. On a total overrun the LARGEST job is killed: the likeliest
    # culprit, and the one that frees the most.
    def record(sample)
      doomed = []
      @jobs.each_value do |job|
        # Sum in KB and convert once: rounding each process to MB first would floor a group
        # of many small processes to nothing.
        job[:current] = sample[job[:pgid]] / 1024
        job[:peak]    = [job[:peak], job[:current]].max
        next unless job[:current] > @per_job_mb && job[:exceeded].nil?

        job[:exceeded] = :job
        doomed << job[:pgid]
      end

      live = @jobs.each_value.reject { |job| job[:exceeded] }
      if live.any? && live.sum { |job| job[:current] } > @total_mb
        worst = live.max_by { |job| job[:current] }
        worst[:exceeded] = :total
        doomed << worst[:pgid]
      end
      doomed
    end

    def rss_kb_by_pgid
      totals = Hash.new(0)
      `ps -axo rss=,pgid= 2>/dev/null`.each_line do |line|
        rss, pgid = line.split
        totals[pgid.to_i] += rss.to_i if pgid
      end
      totals
    rescue StandardError
      nil # a failed fork here must not take the sweep down
    end

    def kill_group(pgid)
      Process.kill('-KILL', pgid)
    rescue StandardError
      nil
    end
  end
end
