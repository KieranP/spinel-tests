# frozen_string_literal: true

require_relative 'machine'

module SpinelCheck
  # Every runtime knob, resolved once from the environment.
  #
  # NOTE: the budget is PER spinel-check PROCESS. Two runs at once (a `regression` sweep
  # plus a `forms` probe, say) each get the full ceiling, so together they can exceed it —
  # pass a smaller SPINEL_JOBS / SPINEL_MAXRSS to the second one.
  class Config
    DEFAULT_TIMEOUT     = 30    # seconds of wall clock per process
    DEFAULT_MAX_RSS     = 2048  # MB per job (process group)
    DEFAULT_MEM_POLL    = 0.3   # seconds between `ps` samples
    DEFAULT_MEMTOP_ROWS = 40
    # 60% of RAM leaves the OS and the editor/browser their working set, so crossing the
    # sweep-wide ceiling means "slow", not "frozen".
    TOTAL_RAM_SHARE = 0.6

    attr_reader :corpus_root, :spinel, :timeout, :max_rss, :max_rss_total, :mem_poll, :jobs, :memtop_rows

    def self.from_env(corpus_root, env: ENV, machine: Machine)
      max_rss       = int(env['SPINEL_MAXRSS'], DEFAULT_MAX_RSS)
      max_rss_total = int(env['SPINEL_MAXRSS_TOTAL'], (machine.ram_mb * TOTAL_RAM_SHARE).to_i)

      new(
        corpus_root: corpus_root,
        spinel: env['SPINEL_BIN'] || File.join(Dir.home, 'spinel', 'bin', 'spinel'),
        # Floored at 1: Timeout.timeout(0) means "no timeout at all" in Ruby, so
        # SPINEL_TIMEOUT=0 would silently remove the very hang protection this exists for.
        timeout: [int(env['SPINEL_TIMEOUT'], DEFAULT_TIMEOUT), 1].max,
        max_rss: max_rss,
        max_rss_total: max_rss_total,
        mem_poll: (env['SPINEL_MEM_POLL'] || DEFAULT_MEM_POLL).to_f,
        jobs: [int(env['SPINEL_JOBS'], nil) || default_jobs(machine.cpus, max_rss, max_rss_total), 1].max,
        memtop_rows: int(env['SPINEL_MEMTOP_N'], DEFAULT_MEMTOP_ROWS)
      )
    end

    # Concurrency follows the memory budget, not just the core count: N jobs each allowed
    # max_rss must fit inside max_rss_total, otherwise the per-job caps sum to more RAM
    # than exists and the box thrashes before any single job is over its own limit.
    def self.default_jobs(cpus, max_rss, max_rss_total)
      [cpus, max_rss_total / [max_rss, 1].max].min.clamp(1, cpus)
    end

    def self.int(value, fallback)
      value.nil? || value.to_s.empty? ? fallback : value.to_i
    end

    private_class_method :int, :default_jobs

    def initialize(corpus_root:, spinel:, timeout:, max_rss:, max_rss_total:, mem_poll:, jobs:, memtop_rows:)
      @corpus_root   = corpus_root
      @spinel        = spinel
      @timeout       = timeout
      @max_rss       = max_rss
      @max_rss_total = max_rss_total
      @mem_poll      = mem_poll
      @jobs          = jobs
      @memtop_rows   = memtop_rows
    end
  end
end
