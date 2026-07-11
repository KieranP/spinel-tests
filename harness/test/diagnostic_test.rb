# frozen_string_literal: true

require_relative 'test_helper'

class DiagnosticTest < Minitest::Test
  Diagnostic = SpinelCheck::Diagnostic

  def test_no_stderr_is_clean
    assert_nil Diagnostic.level(nil)
    assert_nil Diagnostic.level('')
  end

  # The crucial trap: the compiled binary's own runtime exceptions land on stderr, and are
  # NOT compile problems — Ruby prints the same thing and the stdout compare covers it.
  def test_runtime_exception_is_not_a_compile_diagnostic
    assert_nil Diagnostic.level("f.rb:3:in 'Integer#pow': negative argument (ArgumentError)\n")
  end

  def test_compiler_warning
    assert_equal :warn, Diagnostic.level("out.c:188:32: warning: cast to 'const char *'\n")
    assert_equal :warn, Diagnostic.level("3 warnings generated.\n")
  end

  def test_compiler_error
    assert_equal :error, Diagnostic.level("out.c:12:5: error: incompatible types\n")
    assert_equal :error, Diagnostic.level("spinel: C compilation failed\n")
  end

  def test_front_end_reject
    assert_equal :error, Diagnostic.level("spinel: unsupported method Hash#compare_by_identity\n")
  end

  # A failed compile log carries warnings AND errors; the error is what matters.
  def test_error_wins_over_warning
    assert_equal :error, Diagnostic.level("a.c:1: warning: x\na.c:2: error: y\n1 warning generated.\n")
  end

  def test_summary_quotes_the_specific_complaint_not_the_tally
    stderr = "clang -O2 …\nout.c:188:32: warning: cast to 'const char *'\n1 warning generated.\n"
    assert_equal "out.c:188:32: warning: cast to 'const char *'", Diagnostic.summary(stderr)
  end

  def test_summary_falls_back_to_the_first_non_blank_line
    assert_equal 'something odd happened', Diagnostic.summary("\n\nsomething odd happened\n")
  end
end
