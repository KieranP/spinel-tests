# frozen_string_literal: true

require_relative 'base'

module SpinelCheck
  module Commands
    # Show the resolved settings and which variable sets each.
    #
    # This is the first thing to run when a sweep behaves unexpectedly — it is where a
    # mistyped SPINEL_BIN or an unintended job count becomes visible. It deliberately does
    # NOT check that the toolchain exists: seeing the wrong path is the point.
    class Env < Base
      SETTINGS = [
        ['spinel', :spinel, 'SPINEL_BIN'],
        ['jobs', :jobs, 'SPINEL_JOBS'],
        ['timeout', :timeout, 'SPINEL_TIMEOUT'],
        ['max rss/job', :max_rss, 'SPINEL_MAXRSS'],
        ['max rss total', :max_rss_total, 'SPINEL_MAXRSS_TOTAL'],
        ['memory poll', :mem_poll, 'SPINEL_MEM_POLL'],
        ['memtop rows', :memtop_rows, 'SPINEL_MEMTOP_N']
      ].freeze

      UNITS = { timeout: 's', max_rss: 'MB', max_rss_total: 'MB', mem_poll: 's' }.freeze

      def call
        width = SETTINGS.map { |label,| label.length }.max
        values = SETTINGS.map { |_, key, _| "#{config.public_send(key)}#{UNITS[key]}" }
        value_width = values.map(&:length).max

        SETTINGS.each_with_index do |(label, _, var), index|
          puts format("%-#{width}s  %-#{value_width}s  (%s)", label, values[index], var)
        end
        puts
        puts "corpus  #{config.corpus_root}"
      end
    end
  end
end
