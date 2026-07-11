# frozen_string_literal: true

module SpinelCheck
  # Classifies Spinel's STDERR into a compile-time diagnostic level.
  #
  # The crucial trap: the *compiled binary's* runtime exceptions land on stderr too (e.g.
  # `negative argument (ArgumentError)`), and those are NOT compile issues — the stdout
  # compare already accounts for the raise, and Ruby prints the same thing. So only genuine
  # compile-time markers count, and a bare runtime error classifies as nil (clean).
  #
  # A WARNING is a bug, not a nuisance: Spinel must never emit ill-typed C, so a form that
  # compiles-with-warnings but prints matching output is still broken.
  module Diagnostic
    #   gcc `error:` / `spinel: C compilation failed`        -> C compile abort
    #   `spinel: … unsupported …` (any `spinel:` line)       -> front-end reject
    ERROR = /\berror:|compilation failed|^spinel: /
    #   gcc `warning:` / `N warnings generated.`
    WARNING = /\bwarning:|warnings? generated/
    # The line to quote under a row: the specific complaint, not the trailing tally.
    QUOTABLE = /\bwarning:|\berror:|compilation failed|^spinel: /

    module_function

    # :error is tested first — a failed compile log carries warnings *and* errors.
    def level(stderr)
      return nil if stderr.nil? || stderr.empty?
      return :error if stderr.match?(ERROR)
      return :warn if stderr.match?(WARNING)

      nil
    end

    # The one line worth showing under a flagged row.
    def summary(stderr)
      return nil if stderr.nil? || stderr.empty?

      stderr.lines.grep(QUOTABLE).first&.chomp ||
        stderr.lines.map(&:chomp).find { |line| !line.strip.empty? }
    end
  end
end
