# frozen_string_literal: true

require_relative 'base'
require_relative '../errors'
require_relative '../reporter'

module SpinelCheck
  module Commands
    # Diff a whole suite directory, triaged by tag.
    #
    # A file is flagged when its stdout diverges OR Spinel emitted a compile-time diagnostic.
    # That second axis is the one a plain stdout diff cannot see: a file that compiles WITH
    # WARNINGS but still prints matching output looks perfect to a value compare, yet those
    # warnings routinely flag real bugs (out-of-range casts, incompatible pointer types) —
    # and a C compile abort is always a bug. Runtime exceptions on stderr are NOT flagged;
    # the stdout diff already covers those.
    class Regression < Base
      DEFAULT_DIR = 'tests'

      def call(dir)
        target = dir || DEFAULT_DIR
        files = Dir.glob("#{target}/**/*.rb").sort
        # An empty sweep otherwise reports "0 flagged of 0 files", which reads as a clean
        # bill of health rather than as a bad path.
        raise Error, "no .rb files under #{target}" if files.empty?

        flagged = sweep(files, label: 'regression', tick: ->(path) { short_label(path) }) { |path|
          comparison = compare(path)
          flag(path, comparison) unless comparison.clean?
        }.compact

        flagged.each { |row| print_row(row) }
        report(flagged, files.size)
      end

      private

      Row = Data.define(:status, :path, :tag, :diagnostic)
      private_constant :Row

      def flag(path, comparison)
        Row.new(
          status: comparison.status,
          path: "#{path}#{peak_note(comparison.peak_mb)}",
          tag: File.read(path)[Source::ANY_TAG] || 'UNTAGGED',
          diagnostic: comparison.diagnostic ? comparison.diagnostic_line : nil
        )
      end

      def print_row(row)
        puts "#{status(row.status, width: 12)} #{row.path}    [#{row.tag}]"
        puts "            #{row.diagnostic[0, Reporter::MAX_COLUMNS]}" if row.diagnostic
      end

      def report(flagged, total)
        counts = {
          'DIFF' => flagged.count { |row| row.status.start_with?('DIFF') },
          'TIMEOUT' => flagged.count { |row| row.status.start_with?('TIMEOUT') },
          'MEMORY' => flagged.count { |row| row.status.start_with?('MEMORY') },
          'WARN' => flagged.count { |row| row.status.include?('WARN') },
          'CERR' => flagged.count { |row| row.status.include?('CERR') }
        }
        summary("#{flagged.size} flagged of #{total} files", counts)
        puts '(WARN/CERR = Spinel emitted C-compiler warnings / a compile error or front-end reject on'
        puts ' stderr. A WARN whose stdout still matches is invisible to a stdout-only diff; a compile'
        puts ' abort is always a bug. Runtime exceptions on stderr are NOT flagged — the stdout diff covers'
        puts ' those.)'
        reporter.timeout_footer if counts['TIMEOUT'].positive?
        reporter.memory_footer  if counts['MEMORY'].positive?
      end
    end
  end
end
