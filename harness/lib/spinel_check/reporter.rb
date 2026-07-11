# frozen_string_literal: true

require_relative 'style'

module SpinelCheck
  # Everything the commands print, so that all of them explain a failure the same way.
  class Reporter
    # A repro that dumps something huge on one line (the whole ENV hash, say) must not
    # flood the terminal.
    MAX_DIFF_LINES = 8
    MAX_COLUMNS    = 200

    def initialize(config:, io: $stdout)
      @config = config
      @io     = io
      @style  = Style.new(io)
    end

    def puts(text = '') = @io.puts(text)

    def status(token, width: 0) = @style.status(token, width: width)

    # A qualification on a verdict, not a failure of it — printed on STDOUT beside the row
    # it belongs to.
    #
    # It used to go to stderr, where the progress bar now draws: the bar's carriage returns
    # smear it, and the one caveat you must not miss is exactly this one ("this verdict may
    # be a false pass").
    def caveat(text, indent) = puts("#{indent}#{@style.caution("⚠ #{text}")}")

    # Why a form is not clean: the stdout divergence (if any) AND the compile diagnostic
    # (if any).
    #
    # Both halves matter. A compile warning with matching stdout has no diff to show, only
    # the diagnostic line — and that is exactly the case a stdout-only compare used to miss.
    def failure(comparison, indent)
      diff(comparison, indent) unless comparison.matched?
      return unless (level = comparison.diagnostic)

      label = level == :error ? 'compile error' : 'compile warning'
      puts "#{indent}#{label}: #{comparison.diagnostic_line.to_s[0, MAX_COLUMNS]}"
    end

    def diff(comparison, indent)
      comparison.diff.lines.first(MAX_DIFF_LINES).each { |line| puts "#{indent}#{line.chomp[0, MAX_COLUMNS]}" }
    end

    # Shown only when a run was unusually hungry (half the per-job cap or more). Silent for
    # ordinary runs: a compile that needs a few hundred MB is normal and is not news.
    def peak_note(peak_mb)
      peak_mb.to_i >= @config.max_rss / 2 ? "    [peak #{peak_mb}MB]" : ''
    end

    # Printed once per run that hit the guard, so a MEMORY row is never mistaken for a value
    # difference — nothing was compared, the job was SIGKILLed for RAM.
    def memory_footer
      puts "MEMORY = the job's process group crossed SPINEL_MAXRSS (#{@config.max_rss}MB) or the sweep"
      puts " crossed SPINEL_MAXRSS_TOTAL (#{@config.max_rss_total}MB) and was killed, so nothing was"
      puts ' compared. Re-run that one file alone with a larger cap to see what it really needs:'
      puts "   SPINEL_JOBS=1 SPINEL_MAXRSS=8192 #{COMMAND} memtop <file.rb>"
    end

    def timeout_footer
      puts "TIMEOUT = one side exceeded SPINEL_TIMEOUT (#{@config.timeout}s), so nothing was compared."
      puts ' Under a full-suite sweep every core is compiling, and a file that is merely slow on its'
      puts ' own can cross the wall clock — recheck those files alone, or with a larger'
      puts ' SPINEL_TIMEOUT, before treating one as a finding.'
    end

    # `78 reports  |  39 MATCH  |  36 DIFF  |  0 WARN`. A zero is kept — "0 CERR" is
    # reassurance worth printing. A count that does not apply to this run is passed as nil
    # and omitted entirely.
    def summary(headline, counts)
      parts = counts.filter_map { |label, count| "#{count} #{label}" unless count.nil? }
      puts "\n#{[headline, *parts].join('  |  ')}"
    end
  end
end
