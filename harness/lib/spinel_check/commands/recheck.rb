# frozen_string_literal: true

require_relative 'base'

module SpinelCheck
  module Commands
    # The quick "what moved on this build?" scan.
    #
    # Runs ONLY each report's primary repro — `bugs/<id>_*.rb` exactly as committed — over
    # every report, in parallel. A MATCH means the primary symptom is gone AND the repro
    # compiles clean, but NOT that the bug is fixed: the secondary forms and the tagged
    # `tests/` lines are untested. So a MATCH is a CANDIDATE, not a verdict — `verify` is
    # what settles it.
    #
    # Non-MATCH rows carry a status (DIFF, WARN, CERR, or a combination) and print the diff
    # and diagnostic, so a repro whose divergence has CHANGED — a new error, a lingering
    # warning, partial progress — is visible rather than hidden behind a bare flag.
    class Recheck < Base
      # Shared with Triage, which needs the same scan before deciding what to verify.
      def scan(label: 'recheck')
        sweep(Repo.bug_repros, label: label, tick: ->(path) { File.basename(path) }) { |path| compare(path) }
      end

      def call
        results = scan
        results.each { |comparison| row(comparison) }
        report(results)
      end

      private

      def row(comparison)
        if comparison.clean?
          puts "#{status('MATCH')}  #{comparison.path}#{peak_note(comparison.peak_mb)}"
        else
          puts "#{status(comparison.status, width: 9)} #{comparison.path}#{peak_note(comparison.peak_mb)}"
          failure(comparison, ' ' * 9)
        end
      end

      def report(results)
        memory = results.count(&:memory_killed?)
        summary("#{results.size} reports",
                'MATCH' => results.count(&:clean?),
                'DIFF' => results.count { |c| !c.matched? },
                'WARN' => results.count { |c| c.diagnostic == :warn },
                'CERR' => results.count { |c| c.diagnostic == :error },
                'MEMORY' => memory.zero? ? nil : memory)
        puts '(MATCH = primary repro passes AND compiles clean; run `verify <ID>` to confirm ALL forms'
        puts ' before removing. WARN/CERR = a compile warning/error is still emitted — treated as a bug.)'
        reporter.memory_footer if memory.positive?
      end
    end
  end
end
