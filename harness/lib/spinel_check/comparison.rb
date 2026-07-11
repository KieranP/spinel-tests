# frozen_string_literal: true

require_relative 'diagnostic'
require_relative 'divergence'

module SpinelCheck
  # One file run under both toolchains, and every verdict that follows from it.
  #
  # This is the vocabulary the commands share. Before it existed, each of them re-derived
  # `matched? / diagnostic / timed_out? / memory_killed? / status` from a bare tuple, which
  # is how a run that was SIGKILLed for RAM could get reported as a value difference.
  class Comparison
    attr_reader :path, :ruby, :spinel

    def self.of(path, runner)
      new(path: path, ruby: runner.ruby(path), spinel: runner.spinel(path))
    end

    def initialize(path:, ruby:, spinel:)
      @path   = path
      @ruby   = ruby
      @spinel = spinel
    end

    def matched? = ruby.stdout == spinel.stdout

    # Compile-time diagnostic from Spinel, if any (:error / :warn / nil).
    #
    # `defined?`, not `||=`: nil is the COMMON answer here (most runs compile clean), and
    # `||=` would re-scan stderr on every one of the several reads each row makes.
    def diagnostic
      return @diagnostic if defined?(@diagnostic)

      @diagnostic = Diagnostic.level(spinel.stderr)
    end

    def diagnostic_line = Diagnostic.summary(spinel.stderr)

    # A run is clean only when stdout matches AND Spinel emitted no compile diagnostic.
    def clean? = matched? && diagnostic.nil?

    def timed_out?     = ruby.timed_out? || spinel.timed_out?
    def memory_killed? = ruby.memory_killed? || spinel.memory_killed?

    def peak_mb = [ruby.peak_mb, spinel.peak_mb].max

    # Both memoized: a failing row has its diff computed for display and its changes
    # computed for the "did activating this report introduce it?" test, and an LCS over
    # whole-program output is not free.
    def diff    = @diff    ||= Divergence.text(ruby.stdout, spinel.stdout)
    def changes = @changes ||= Divergence.changes(ruby.stdout, spinel.stdout)

    # Combined status token for a flagged row — 'DIFF', 'WARN', 'DIFF+CERR', 'MEMORY'.
    # MEMORY and TIMEOUT subsume DIFF: the stdout that would be compared is a marker, so
    # calling it a value difference would be a lie.
    #
    # A clean comparison has no status token, so this is '' — callers print their own
    # affirmative label (MATCH, OK) rather than asking for one here.
    def status
      cause =
        if memory_killed? then 'MEMORY'
        elsif timed_out? then 'TIMEOUT'
        elsif !matched? then 'DIFF'
        end
      [cause, DIAGNOSTIC_TOKEN[diagnostic]].compact.join('+')
    end

    DIAGNOSTIC_TOKEN = { warn: 'WARN', error: 'CERR' }.freeze
    private_constant :DIAGNOSTIC_TOKEN
  end
end
