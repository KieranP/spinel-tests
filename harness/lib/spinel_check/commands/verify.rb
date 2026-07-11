# frozen_string_literal: true

require_relative 'base'
require_relative '../verifier'

module SpinelCheck
  module Commands
    # The slow confirm: activate every form a report owns and report whether all of them
    # now compile clean and match. See Verifier for what "every form" means and why a
    # shared test file is judged by this report's contribution rather than as a whole.
    class Verify < Base
      def call(target)
        ids = target.nil? || target == 'all' ? Repo.ids : [target]
        verdicts = sweep(ids, label: 'verify', tick: :itself.to_proc) { |id| verifier.call(id) }
        verdicts.each { |verdict| row(verdict) }

        fixed = verdicts.count(&:fixed?)
        summary("#{verdicts.size} checked",
                'FIXED' => fixed,
                'still broken / partial' => verdicts.size - fixed)
      end

      private

      def row(verdict)
        if verdict.fixed?
          puts "#{status('FIXED', width: 13)} #{verdict.id}  " \
               "(all forms compile clean + match — safe to `activate #{verdict.id}` and delete)"
        elsif verdict.missing?
          puts "#{status('NO-TESTS', width: 13)} #{verdict.id}  (no bugs/*.rb or # BUG tag found)"
        else
          puts "#{status('STILL-BROKEN')}  #{verdict.id}"
          verdict.failures.each do |failed|
            puts "                #{failed.path}"
            failure(failed.comparison, ' ' * 18)
          end
        end
        caveats(verdict, ' ' * 14)
      end
    end
  end
end
