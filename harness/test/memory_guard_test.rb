# frozen_string_literal: true

require_relative 'test_helper'

class MemoryGuardTest < Minitest::Test
  def guard(per_job: 99_999, total: 99_999, poll: 60)
    SpinelCheck::MemoryGuard.new(per_job_mb: per_job, total_mb: total, poll: poll)
  end

  def test_release_reports_no_usage_for_a_completed_job
    subject = guard
    usage = subject.release(subject.watch(Process.pid))
    refute usage.killed?
    assert_equal 0, usage.peak_mb
  end

  def test_releasing_an_unknown_token_is_harmless
    refute guard.release(:never_watched).killed?
  end

  # A pgid is a pid, and the kernel can hand the same one to a new job in the window between
  # reaping this child and releasing it. Keyed by pgid, one job's release would delete
  # another's entry and silently leave that job uncapped.
  def test_two_jobs_sharing_a_pgid_get_independent_tokens
    subject = guard
    first  = subject.watch(4242)
    second = subject.watch(4242)
    refute_equal first, second

    subject.release(first)
    # The second registration must survive its namesake's release — still killable.
    assert_includes subject.live_pgids, 4242
    subject.release(second)
    assert_empty subject.live_pgids
  end

  def test_stop_refuses_further_jobs
    subject = guard
    refute subject.stopped?
    subject.stop!
    assert subject.stopped?
  end

  # Each job is deliberately in its own process group, so a Ctrl-C at the terminal never
  # reaches the children — this registry is the only thing that knows their pgids.
  def test_stop_kills_watched_groups
    subject = guard
    pid = Process.spawn('sleep', '30', pgroup: true, out: File::NULL, err: File::NULL)
    subject.watch(pid)

    subject.stop!
    Process.wait(pid) # reap, so no zombie is left behind
    assert $?.signaled?, 'expected the process group to have been signalled'
    assert_equal 'KILL', Signal.signame($?.termsig)
  ensure
    begin
      Process.kill('-KILL', pid)
    rescue StandardError
      nil
    end
  end
end
