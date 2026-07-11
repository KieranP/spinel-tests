# frozen_string_literal: true

require 'parallel'

module SpinelCheck
  # Runs work across a bounded thread pool, preserving input order.
  #
  # Threads, not processes: each unit of work is dominated by waiting on a spawned compiler,
  # and the memory guard needs every job's process group visible from one address space.
  module Pool
    MAX_THREADS = 64

    module_function

    def map(items, jobs:, &)
      return [] if items.empty?

      Parallel.map(items, in_threads: [jobs, items.size].min.clamp(1, MAX_THREADS), &)
    end
  end
end
