# frozen_string_literal: true

require_relative 'config'
require_relative 'memory_guard'
require_relative 'runner'
require_relative 'reporter'

module SpinelCheck
  # The wiring every command needs, built once per process.
  #
  # It is passed in rather than reached for globally so the pieces stay independently
  # testable — a command can be handed a runner that never spawns anything.
  class Context
    attr_reader :config, :guard, :runner, :reporter

    def self.build(corpus_root, env: ENV, io: $stdout)
      config = Config.from_env(corpus_root, env: env)
      guard  = MemoryGuard.new(
        per_job_mb: config.max_rss,
        total_mb: config.max_rss_total,
        poll: config.mem_poll
      )
      new(
        config: config,
        guard: guard,
        runner: Runner.new(config: config, guard: guard),
        reporter: Reporter.new(config: config, io: io)
      )
    end

    def initialize(config:, guard:, runner:, reporter:)
      @config   = config
      @guard    = guard
      @runner   = runner
      @reporter = reporter
    end
  end
end
