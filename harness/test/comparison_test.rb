# frozen_string_literal: true

require_relative 'test_helper'

class ComparisonTest < Minitest::Test
  Result = SpinelCheck::Runner::Result

  def result(stdout, stderr: '', outcome: :ok, peak_mb: 0)
    Result.new(stdout: stdout, stderr: stderr, peak_mb: peak_mb, outcome: outcome)
  end

  def comparison(ruby:, spinel:)
    SpinelCheck::Comparison.new(path: 'f.rb', ruby: ruby, spinel: spinel)
  end

  def test_matching_stdout_with_no_diagnostic_is_clean
    c = comparison(ruby: result("1\n"), spinel: result("1\n"))
    assert c.clean?
    assert_empty c.status
  end

  # A warning is a bug — Spinel must never emit ill-typed C — so matching output is still
  # not a pass.
  def test_matching_stdout_with_a_compile_warning_is_not_clean
    c = comparison(ruby: result("1\n"), spinel: result("1\n", stderr: "a.c:1: warning: cast\n"))
    assert c.matched?
    refute c.clean?
    assert_equal 'WARN', c.status
  end

  def test_diverging_stdout
    c = comparison(ruby: result("1\n"), spinel: result("2\n"))
    refute c.clean?
    assert_equal 'DIFF', c.status
  end

  def test_divergence_and_compile_error_combine
    c = comparison(ruby: result("1\n"), spinel: result("2\n", stderr: "spinel: C compilation failed\n"))
    assert_equal 'DIFF+CERR', c.status
  end

  # A run killed for RAM compared nothing, so calling it a value difference would be a lie.
  def test_memory_kill_subsumes_diff
    c = comparison(ruby: result("1\n"), spinel: result('[MEMORY killed…]', outcome: :memory_job))
    assert c.memory_killed?
    assert_equal 'MEMORY', c.status
  end

  def test_timeout_subsumes_diff
    c = comparison(ruby: result("1\n"), spinel: result('[TIMEOUT after 30s]', outcome: :timeout))
    assert c.timed_out?
    assert_equal 'TIMEOUT', c.status
  end

  def test_peak_is_the_hungrier_side
    c = comparison(ruby: result("1\n", peak_mb: 40), spinel: result("1\n", peak_mb: 900))
    assert_equal 900, c.peak_mb
  end

  # The compiled binary's runtime exceptions land on stderr but are not compile problems.
  def test_runtime_exception_on_stderr_is_not_flagged
    c = comparison(ruby: result("x\n"), spinel: result("x\n", stderr: "f.rb:1: boom (RuntimeError)\n"))
    assert c.clean?
  end

  # nil is the common answer here, and `||=` would re-scan stderr on every read. The cache
  # must be populated even when the answer is nil.
  def test_nil_diagnostic_is_memoized_not_recomputed
    c = comparison(ruby: result("1\n"), spinel: result("1\n"))
    refute c.instance_variable_defined?(:@diagnostic)
    assert_nil c.diagnostic
    assert c.instance_variable_defined?(:@diagnostic),
           '`||=` would leave nil uncached and re-scan stderr on every read'
  end

  # A clean comparison carries no status token; callers print their own MATCH / OK.
  def test_clean_comparison_has_an_empty_status
    assert_empty comparison(ruby: result("1\n"), spinel: result("1\n")).status
  end
end
