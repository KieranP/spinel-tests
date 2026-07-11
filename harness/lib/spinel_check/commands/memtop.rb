# frozen_string_literal: true

require_relative 'base'
require_relative '../errors'

module SpinelCheck
  module Commands
    # Rank files by how much memory compiling them costs — the question a MEMORY row raises.
    #
    # Runs each file under both toolchains and reports peak resident set per process GROUP
    # (spinel, the cc it forks, and the binary it runs), highest first, so a compile that
    # needs gigabytes is named rather than guessed at.
    #
    # Peaks come from sampling, so they are close-enough, not exact — a sub-poll spike can
    # be missed. For clean attribution run it serially: with several jobs live, the
    # sweep-wide ceiling can kill a job that was not itself the hog.
    #
    #   SPINEL_JOBS=1 SPINEL_MAXRSS=8192 harness/bin/spinel-check memtop <file>
    class Memtop < Base
      def call(paths)
        files = Repo.expand(paths, default: 'bugs')
        raise Error, 'memtop: no .rb files found' if files.empty?

        rows = sweep(files, label: 'memtop', tick: ->(path) { short_label(path) }) { |path| measure(path) }
        print_table(rows.sort_by { |row| -row.peak_mb })
      end

      private

      Row = Data.define(:path, :spinel_mb, :ruby_mb, :killed) do
        def peak_mb = [spinel_mb, ruby_mb].max
      end
      private_constant :Row

      def measure(path)
        ruby   = runner.ruby(path)
        spinel = runner.spinel(path)
        Row.new(
          path: path,
          spinel_mb: spinel.peak_mb,
          ruby_mb: ruby.peak_mb,
          killed: (:spinel if spinel.memory_killed?) || (:ruby if ruby.memory_killed?)
        )
      end

      def print_table(ranked)
        # Always list every killed run, however far down the ranking it lands.
        shown  = ranked.first(config.memtop_rows) | ranked.select(&:killed)
        hidden = ranked.size - shown.size

        puts format('%9s %9s  %s', 'spinel', 'ruby', 'file')
        shown.each do |row|
          note = row.killed ? "    [KILLED: #{row.killed} hit the cap]" : ''
          puts format('%7dMB %7dMB  %s%s', row.spinel_mb, row.ruby_mb, row.path, note)
        end
        puts "(#{hidden} lower-ranked files not shown; SPINEL_MEMTOP_N=#{config.memtop_rows})" if hidden.positive?

        worst = ranked.first
        puts "\n#{ranked.size} files  |  worst #{worst.peak_mb}MB (#{worst.path})  |  " \
             "cap #{config.max_rss}MB/job, #{config.max_rss_total}MB total, #{config.jobs} jobs"
      end
    end
  end
end
