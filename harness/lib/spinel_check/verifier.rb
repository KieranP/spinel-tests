# frozen_string_literal: true

require 'tmpdir'
require 'set'

require_relative 'comparison'
require_relative 'repo'
require_relative 'source'

module SpinelCheck
  # The authoritative "is this report actually fixed?" check — and the only safe basis for
  # deleting one.
  #
  # Where a recheck runs a report's primary repro exactly as committed, this activates
  # EVERY form the report owns: all the secondary and compile-abort variants commented out
  # in `bugs/<id>_*.rb`, plus every tagged `tests/` line. A report is FIXED only when all of
  # them compile CLEAN — no warnings — and match. It is slower by a dozen-odd compiles per
  # report, which is why it is not the every-build first pass.
  # ONE instance is shared by every worker thread, so this must stay stateless: findings are
  # returned, never accumulated on the object.
  class Verifier
    Failure = Data.define(:path, :comparison)

    # What checking one target produced. Either may be nil — a target can fail, carry a
    # caveat, both, or neither.
    Check = Data.define(:failure, :caveat)
    private_constant :Check

    Verdict = Data.define(:id, :state, :failures, :checked, :caveats) do
      def fixed?   = state == :fixed
      def broken?  = state == :broken
      def missing? = state == :missing
      # How many of the report's forms came back clean. A :broken verdict with at least one
      # clean form is a genuine PARTIAL fix; with none, the report is simply still broken.
      def passed = checked - failures.size
    end

    def initialize(runner:)
      @runner = runner
    end

    def call(id)
      targets = Repo.test_files_for(id) + [Repo.repro_for(id)].compact
      return Verdict.new(id: id, state: :missing, failures: [], checked: 0, caveats: []) if targets.empty?

      checks = Dir.mktmpdir do |dir|
        targets.each_with_index.map { |path, index| check(path, id, dir, index) }
      end
      failures = checks.filter_map(&:failure)

      Verdict.new(id: id, state: failures.empty? ? :fixed : :broken, failures: failures,
                  checked: targets.size, caveats: checks.filter_map(&:caveat))
    end

    private

    def check(path, id, dir, index)
      own_repro = repro?(path)
      lines     = File.readlines(path)
      activated = (own_repro ? Source::Activation.uncomment_all(lines) : Source::Activation.for_ids(lines, Set[id])).join

      # If activation produced unparseable Ruby, fall back to the file as-is — but say so.
      # The as-is file may still have the buggy form commented out, so a "match" there can
      # be a false FIXED, and the verdict should not be trusted blindly.
      parseable = Source.parses?(activated)
      caveat = parseable ? nil : "activation of #{path} yielded unparseable Ruby; tested as-is (verdict may false-pass)"

      candidate  = write(dir, "a#{index}", path, parseable ? activated : lines.join)
      comparison = Comparison.of(candidate, @runner)

      # For the report's own repro, the file AS COMMITTED has to be clean too — activating
      # every commented form can MASK the bug rather than expose it. One report's commented
      # forms are documented "compile clean" CONTRASTS, and activating them alongside the
      # live repro changed Spinel's inference enough that the warning the report is about
      # stopped being emitted: all-forms-activated looked clean while the committed repro
      # still warned. Checking both is also what makes `verify` agree with `recheck`.
      if own_repro && comparison.clean? && (as_committed = uncommitted_check(lines, activated, dir, index, path))
        return Check.new(failure: Failure.new(path: path, comparison: as_committed), caveat: caveat)
      end

      return Check.new(failure: nil, caveat: caveat) if comparison.clean?

      # The report's OWN standalone repro has no co-hosting, so its ruby stdout is the whole
      # oracle: any divergence fails it. Same when we fell back to the file as-is.
      failed =
        if own_repro || !parseable
          true
        else
          introduced?(comparison, dir, index, path, lines, id)
        end

      Check.new(failure: failed ? Failure.new(path: path, comparison: comparison) : nil, caveat: caveat)
    end

    # A shared `tests/` file often co-hosts OTHER open bugs' live-diverging lines, so the
    # whole file diverges no matter what this report does — checking the file as a whole
    # flagged EVERY report in such a file as partial.
    #
    # So judge only THIS report's CONTRIBUTION: activating <id> fails the file only if it
    # CHANGES the file's divergence or its compile-diagnostic level compared with the same
    # file with <id> NEUTRALIZED. A report whose own forms are clean is then FIXED even
    # while the file still diverges because of a co-hosted bug.
    def introduced?(comparison, dir, index, path, lines, id)
      baseline = write(dir, "b#{index}", path, Source::Activation.neutralize(lines, id).join)
      before   = Comparison.of(baseline, @runner)
      comparison.changes != before.changes || comparison.diagnostic != before.diagnostic
    end

    # The repro exactly as committed, when that differs from the activated form. Returns the
    # comparison only when it is NOT clean, i.e. only when it contradicts the activated run.
    def uncommitted_check(lines, activated, dir, index, path)
      source = lines.join
      return nil if source == activated # nothing was commented; already covered

      comparison = Comparison.of(write(dir, "c#{index}", path, source), @runner)
      comparison.clean? ? nil : comparison
    end

    def write(dir, prefix, path, text)
      File.join(dir, "#{prefix}_#{File.basename(path)}").tap { |target| File.write(target, text) }
    end

    def repro?(path) = path.start_with?('bugs/') && path.end_with?('.rb')
  end
end
