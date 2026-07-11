# frozen_string_literal: true

require_relative 'test_helper'

class ConfigTest < Minitest::Test
  Config = SpinelCheck::Config

  Box = Struct.new(:cpus, :ram_mb)

  def config(env = {}, cpus: 12, ram_mb: 16_384)
    Config.from_env('/repo', env: env, machine: Box.new(cpus, ram_mb))
  end

  def test_defaults
    c = config
    assert_equal 30, c.timeout
    assert_equal 2048, c.max_rss
    assert_equal 40, c.memtop_rows
    assert_in_delta 0.3, c.mem_poll
  end

  # 60% of RAM leaves the OS and the editor their working set.
  def test_sweep_ceiling_defaults_to_a_share_of_ram
    assert_equal 9830, config({}, ram_mb: 16_384).max_rss_total
  end

  # N jobs each allowed max_rss must FIT inside the sweep ceiling, or the per-job caps sum
  # to more RAM than exists and the box thrashes before any one job is over its own limit.
  def test_jobs_are_capped_by_the_memory_budget_not_just_cores
    assert_equal 4, config({}, cpus: 12, ram_mb: 16_384).jobs # 9830 / 2048
  end

  def test_jobs_are_capped_by_cores_when_ram_is_plentiful
    assert_equal 8, config({}, cpus: 8, ram_mb: 256_000).jobs
  end

  def test_jobs_never_drop_below_one
    assert_equal 1, config({ 'SPINEL_MAXRSS' => '999999' }, cpus: 12, ram_mb: 16_384).jobs
  end

  def test_env_overrides
    c = config({ 'SPINEL_JOBS' => '3', 'SPINEL_TIMEOUT' => '90', 'SPINEL_MAXRSS' => '512',
                 'SPINEL_MAXRSS_TOTAL' => '4096', 'SPINEL_MEM_POLL' => '1.5', 'SPINEL_MEMTOP_N' => '5' })
    assert_equal 3, c.jobs
    assert_equal 90, c.timeout
    assert_equal 512, c.max_rss
    assert_equal 4096, c.max_rss_total
    assert_in_delta 1.5, c.mem_poll
    assert_equal 5, c.memtop_rows
  end

  def test_blank_env_values_fall_back_to_defaults
    assert_equal 30, config({ 'SPINEL_TIMEOUT' => '' }).timeout
  end

  # Timeout.timeout(0) means "no timeout at all" in Ruby, so 0 would silently remove the
  # hang protection the harness exists to provide.
  def test_timeout_is_floored_at_one_second
    assert_equal 1, config({ 'SPINEL_TIMEOUT' => '0' }).timeout
    assert_equal 1, config({ 'SPINEL_TIMEOUT' => '-5' }).timeout
  end

  def test_jobs_are_floored_at_one
    assert_equal 1, config({ 'SPINEL_JOBS' => '0' }).jobs
    assert_equal 1, config({ 'SPINEL_JOBS' => '-3' }).jobs
  end

  def test_spinel_path_is_overridable
    assert_equal '/opt/spinel', config({ 'SPINEL_BIN' => '/opt/spinel' }).spinel
  end
end
