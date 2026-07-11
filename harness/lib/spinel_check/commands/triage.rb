# frozen_string_literal: true

require_relative 'base'
require_relative 'recheck'
require_relative '../verifier'

module SpinelCheck
  module Commands
    # The per-build entry point: the whole reverify loop in one command.
    #
    # Two phases, so it stays affordable. First the cheap primary-repro scan over EVERY
    # report; then the full multi-form verify on ONLY the reports whose primary now passes —
    # a primary that still diverges is BROKEN, and there is no point paying for the slow
    # all-forms check to learn that.
    #
    # It never deletes anything. FIXED rows come with a ready-to-run activate + rm block.
    class Triage < Base
      # Every report, sorted into the verdict it earned. `broken` holds Comparisons (they
      # never reached the verify phase); the rest hold Verdicts.
      Buckets = Data.define(:scanned, :fixed, :partial, :false_pass, :unresolved, :broken) do
        def memory_killed = broken.count(&:memory_killed?)
        # A MEMORY kill is not evidence about the bug, so it is counted apart from BROKEN.
        def broken_total = broken.size - memory_killed + false_pass.size
      end

      def call
        buckets = classify
        print_fixed(buckets.fixed)
        print_partial(buckets.partial)
        print_unresolved(buckets.unresolved)
        print_false_pass(buckets.false_pass)
        print_broken(buckets.broken)
        report(buckets)
        next_steps(buckets)
      end

      private

      # A :broken verdict with at least one clean form is a genuine PARTIAL fix.
      #
      # With ZERO clean forms it is fully BROKEN: the only reason it became a candidate is
      # that its standalone repro "passed" the primary scan — but a repro whose every buggy
      # form is kept commented, leaving only the contrast lines executable, matches
      # trivially. Calling that PARTIAL ("primary passes") is exactly the trap that makes a
      # still-broken report look half-fixed, so it is split back out.
      def classify
        # Phase 1 and phase 2 are labelled separately on the bar: the second is much slower
        # per item, so an unlabelled counter restarting mid-run looks like a stall.
        scanned = Recheck.new(context).scan(label: 'triage: recheck')
        candidates, broken = scanned.partition(&:clean?)
        verdicts = sweep(candidates.map { |c| Repo.id_for(c.path) },
                         label: 'triage: verify', tick: :itself.to_proc) { |id| verifier.call(id) }

        Buckets.new(
          scanned: scanned,
          fixed: verdicts.select(&:fixed?).sort_by(&:id),
          partial: verdicts.select { |v| v.broken? && v.passed.positive? }.sort_by(&:id),
          false_pass: verdicts.select { |v| v.broken? && v.passed.zero? }.sort_by(&:id),
          # Anything that is neither — :missing, say. Never dropped silently.
          unresolved: verdicts.reject { |v| v.fixed? || v.broken? }.sort_by(&:id),
          broken: broken.sort_by { |c| Repo.id_for(c.path) }
        )
      end

      def print_fixed(fixed)
        fixed.each do |verdict|
          puts "#{status('FIXED', width: 8)} #{verdict.id}  (all forms compile clean + match)"
          caveats(verdict, ' ' * 9)
        end
      end

      def print_partial(partial)
        partial.each do |verdict|
          puts "#{status('PARTIAL', width: 8)} #{verdict.id}  (primary passes; " \
               "#{verdict.passed}/#{verdict.checked} forms clean, #{verdict.failures.size} still fail)"
          print_failures(verdict)
        end
      end

      def print_unresolved(unresolved)
        unresolved.each do |verdict|
          puts "#{status('NO-TESTS', width: 8)} #{verdict.id}  " \
               '(primary passes but no bugs/*.rb or # BUG tag resolved — check by hand)'
          caveats(verdict, ' ' * 9)
        end
      end

      def print_false_pass(false_pass)
        false_pass.each do |verdict|
          puts "#{status('BROKEN', width: 8)} #{verdict.id}  (0/#{verdict.checked} forms clean — " \
               'standalone repro "passes" but every tagged form still fails; a commented-repro ' \
               'false signal, NOT a fix)'
          print_failures(verdict)
        end
      end

      def print_failures(verdict)
        verdict.failures.each do |failed|
          puts "           still fails: #{failed.path}"
          failure(failed.comparison, ' ' * 13)
        end
        caveats(verdict, ' ' * 9)
      end

      def print_broken(broken)
        broken.each do |comparison|
          id = Repo.id_for(comparison.path)
          # A MEMORY kill is NOT evidence about the bug: the run was SIGKILLed for RAM
          # before anything could be compared, so name it rather than filing it under
          # "still diverges".
          puts(
            if comparison.memory_killed?
              "#{status('MEMORY', width: 8)} #{id}  (killed by the memory guard — nothing compared, see below)"
            else
              "#{status('BROKEN', width: 8)} #{id}  (primary repro still diverges / emits a compile diagnostic)"
            end
          )
          failure(comparison, ' ' * 11)
        end
      end

      def report(buckets)
        summary("#{buckets.scanned.size} reports",
                'FIXED' => buckets.fixed.size,
                'PARTIAL' => buckets.partial.size,
                'BROKEN' => buckets.broken_total,
                'MEMORY' => buckets.memory_killed.zero? ? nil : buckets.memory_killed,
                'NO-TESTS' => buckets.unresolved.empty? ? nil : buckets.unresolved.size)
        reporter.memory_footer if buckets.memory_killed.positive?
      end

      def next_steps(buckets)
        unless buckets.fixed.empty?
          puts "\nFIXED -> activate tests, then delete the report pair:"
          puts "  #{COMMAND} activate #{buckets.fixed.map(&:id).join(' ')}"
          buckets.fixed.each { |v| puts "  rm bugs/#{v.id}_*.md bugs/#{v.id}_*.rb" }
        end
        return if buckets.partial.empty?

        puts "\nPARTIAL -> delete the old report and file a NEW one for the still-failing form(s);"
        puts '           activate the now-passing lines and retag the failing ones to the new ID.'
      end
    end
  end
end
