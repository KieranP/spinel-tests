# frozen_string_literal: true

require 'fileutils'
require 'tmpdir'

require_relative 'test_helper'

# Verifier decides FIXED, and FIXED is what licenses deleting a report — so these pin the
# cases where a wrong verdict costs real work: a report deleted while still broken, or a
# report held open forever because a co-hosted bug makes its file diverge.
class VerifierTest < Minitest::Test
  # Never spawns anything. `ruby` echoes the file's executable lines; `spinel` does the same
  # but mangles any line mentioning DIVERGE — so a fixture controls divergence per line.
  #
  # A file containing MASK diverges nowhere: that models a real report where activating the
  # commented forms changed Spinel's inference enough to stop it emitting the diagnostic the
  # report is about.
  class FakeRunner
    Result = SpinelCheck::Runner::Result

    def ruby(path) = build(executable(path).join)

    def spinel(path)
      lines = executable(path)
      return build(lines.join) if lines.any? { |line| line.include?('MASK') }

      build(lines.map { |line| line.include?('DIVERGE') ? "spinel-wrong\n" : line }.join)
    end

    private

    def executable(path)
      File.readlines(path).reject { |line| line.strip.empty? || line.strip.start_with?('#') }
    end

    def build(stdout) = Result.new(stdout: stdout, stderr: '', peak_mb: 0, outcome: :ok)
  end

  def verify(id, bugs: {}, tests: {})
    Dir.mktmpdir do |dir|
      bugs.each { |name, body| write(File.join(dir, 'bugs', name), body) }
      tests.each { |name, body| write(File.join(dir, 'tests', name), body) }
      Dir.chdir(dir) do
        SpinelCheck::Repo.reset!
        SpinelCheck::Verifier.new(runner: FakeRunner.new).call(id)
      end
    end
  ensure
    SpinelCheck::Repo.reset!
  end

  def write(path, body)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, body)
  end

  def test_no_repro_and_no_tagged_line_is_missing
    verdict = verify('42')
    assert verdict.missing?
    assert_equal 0, verdict.checked
  end

  def test_every_form_matching_is_fixed
    verdict = verify('42',
                     bugs: { '42_thing.rb' => "# p 1\n" },
                     tests: { 'foo/bar.rb' => "# p 1  # BUG 42 - cause\n" })
    assert verdict.fixed?, "expected FIXED, got #{verdict.state} #{verdict.failures.map(&:path)}"
    assert_equal 2, verdict.checked
    assert_empty verdict.caveats
  end

  def test_a_form_that_still_diverges_is_broken
    verdict = verify('42',
                     bugs: { '42_thing.rb' => "# p 1\n" },
                     tests: { 'foo/bar.rb' => "# p DIVERGE  # BUG 42 - cause\n" })
    assert verdict.broken?
    assert_equal ['tests/foo/bar.rb'], verdict.failures.map(&:path)
    # One of two forms was clean, which is what separates PARTIAL from fully broken.
    assert_equal 1, verdict.passed
  end

  # A shared tests/ file often co-hosts other open bugs whose lines diverge live, so the
  # file diverges no matter what this report does. Judging the file as a whole flagged EVERY
  # report in such a file as unfixed.
  def test_a_co_hosted_bugs_divergence_does_not_fail_this_report
    verdict = verify('42',
                     bugs: { '42_thing.rb' => "# p 1\n" },
                     tests: { 'foo/bar.rb' => "p DIVERGE  # BUG 99 - someone else\n" \
                                              "# p 1  # BUG 42 - cause\n" })
    assert verdict.fixed?,
           "a co-hosted bug's divergence must not fail this report (got #{verdict.state})"
  end

  # ...but a divergence this report's OWN line introduces, on top of the co-hosted one, must.
  def test_a_divergence_this_report_introduces_still_fails
    verdict = verify('42',
                     bugs: { '42_thing.rb' => "# p 1\n" },
                     tests: { 'foo/bar.rb' => "p DIVERGE  # BUG 99 - someone else\n" \
                                              "# p DIVERGE_MINE  # BUG 42 - cause\n" })
    assert verdict.broken?
    assert_equal ['tests/foo/bar.rb'], verdict.failures.map(&:path)
  end

  # The report's own repro has no co-hosting, so any divergence in it fails outright.
  def test_the_reports_own_repro_is_judged_on_any_divergence
    verdict = verify('42', bugs: { '42_thing.rb' => "# p DIVERGE\n" })
    assert verdict.broken?
    assert_equal ['bugs/42_thing.rb'], verdict.failures.map(&:path)
  end

  # Activating EVERY commented form can mask the bug instead of exposing it: one report's
  # commented forms are documented "compile clean" contrasts, and activating them alongside
  # the live repro stopped Spinel emitting the diagnostic the report is about — so
  # all-forms-activated looked clean while the committed repro still diverged.
  def test_activation_cannot_mask_a_repro_that_diverges_as_committed
    verdict = verify('42', bugs: { '42_thing.rb' => "p DIVERGE\n# p MASK\n" })
    assert verdict.broken?,
           'a repro that diverges AS COMMITTED must fail even when activating its forms looks clean'
    assert_equal ['bugs/42_thing.rb'], verdict.failures.map(&:path)
  end

  # The contrast case: nothing commented, so there is no separate as-committed program.
  def test_a_repro_with_no_commented_forms_is_judged_once
    assert verify('42', bugs: { '42_thing.rb' => "p 1\n" }).fixed?
    assert verify('42', bugs: { '42_thing.rb' => "p DIVERGE\n" }).broken?
  end

  # Activating a mis-tagged comment can yield invalid Ruby. The file is then tested as-is,
  # which can look clean because the buggy form is still commented — so the verdict must
  # carry the caveat rather than passing silently.
  def test_unparseable_activation_is_tested_as_is_with_a_caveat
    verdict = verify('42',
                     bugs: { '42_thing.rb' => "p 1\n" },
                     tests: { 'foo/bar.rb' => "# end  # BUG 42 - cause\n" })
    assert_equal 1, verdict.caveats.size
    assert_match(/unparseable Ruby/, verdict.caveats.first)
    assert_match(/false-pass/, verdict.caveats.first)
  end

  # The caveat must survive onto a FIXED verdict — that is the combination that would
  # otherwise license deleting a report on false evidence.
  def test_a_caveat_rides_along_on_a_fixed_verdict
    verdict = verify('42',
                     bugs: { '42_thing.rb' => "p 1\n" },
                     tests: { 'foo/bar.rb' => "# end  # BUG 42 - cause\n" })
    assert verdict.fixed?
    refute_empty verdict.caveats
  end
end
