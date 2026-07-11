# frozen_string_literal: true

require_relative 'test_helper'

class RunnerTest < Minitest::Test
  def runner(env = {})
    config = SpinelCheck::Config.from_env('/tmp', env: env)
    guard  = SpinelCheck::MemoryGuard.new(per_job_mb: 99_999, total_mb: 99_999, poll: 60)
    SpinelCheck::Runner.new(config: config, guard: guard)
  end

  def test_captures_stdout_and_stderr_separately
    result = runner.run('sh', '-c', 'echo out; echo err >&2')
    assert_equal "out\n", result.stdout
    assert_equal "err\n", result.stderr
    assert result.ok?
  end

  # Folding stderr into stdout would yield false DIFFs; keeping them apart is the whole
  # basis of the value compare.
  def test_stderr_never_reaches_stdout
    refute_includes runner.run('sh', '-c', 'echo noise >&2').stdout, 'noise'
  end

  # A script that reads stdin must not block on the parent's terminal until the timeout.
  def test_stdin_is_dev_null_not_inherited
    result = runner.run('sh', '-c', 'cat')
    assert result.ok?
    assert_empty result.stdout
  end

  def test_timeout_replaces_stdout_with_a_marker
    result = runner({ 'SPINEL_TIMEOUT' => '1' }).run('sh', '-c', 'echo partial; sleep 30')
    assert result.timed_out?
    # The truncated prefix must NOT survive as if it were the program's output.
    refute_includes result.stdout, 'partial'
    assert_includes result.stdout, '[TIMEOUT after 1s]'
  end

  # `spinel -E` runs the binary it just built; if that child outlives spinel it holds the
  # pipe open and the reader threads would block forever.
  def test_returns_even_when_a_grandchild_outlives_the_child
    result = runner({ 'SPINEL_TIMEOUT' => '5' }).run('sh', '-c', 'sleep 30 & echo done')
    assert_equal "done\n", result.stdout
  end

  # A missing toolchain used to surface as a raw backtrace out of the worker pool, after
  # leaking two descriptors per file.
  def test_missing_spinel_raises_an_actionable_error
    error = assert_raises(SpinelCheck::Error) do
      runner({ 'SPINEL_BIN' => '/nonexistent/spinel' }).spinel('/tmp/x.rb')
    end
    assert_match(/spinel not found at \/nonexistent\/spinel/, error.message)
    assert_match(/SPINEL_BIN/, error.message)
  end

  def test_non_executable_spinel_is_named_as_such
    error = assert_raises(SpinelCheck::Error) do
      runner({ 'SPINEL_BIN' => '/etc/hosts' }).spinel('/tmp/x.rb')
    end
    assert_match(/not executable/, error.message)
  end

  # The wall clock covers Process.wait, NOT the pipe drain. A writer that leaves the process
  # group (setsid) survives the group kill and keeps the pipe open, and an unbounded join
  # there hung the harness indefinitely — past its own timeout — which is precisely what a
  # tool built for unattended runs must never do. Slow by design: it spends the drain grace.
  def test_a_writer_that_escapes_the_process_group_cannot_hang_the_run
    escapee = 'ruby -e "Process.setsid; sleep 90" & sleep 1; echo started'
    result = runner({ 'SPINEL_TIMEOUT' => '1' }).run('sh', '-c', escapee)

    assert result.timed_out?, 'an undrainable pipe must never read as a completed run'
    assert_includes result.stdout, 'output pipe still held'
    refute_includes result.stdout, 'started'
  ensure
    system('pkill', '-9', '-f', 'Process.setsid; sleep 90', out: File::NULL, err: File::NULL)
  end

  def test_failed_spawn_leaks_no_descriptors
    subject = runner
    open_now = -> { `lsof -p #{Process.pid} 2>/dev/null`.lines.size }
    20.times { subject.run('/nonexistent/binary') rescue SpinelCheck::Error } # rubocop:disable Style/RescueModifier
    before = open_now.call
    20.times { subject.run('/nonexistent/binary') rescue SpinelCheck::Error } # rubocop:disable Style/RescueModifier
    assert_equal before, open_now.call
  end
end
