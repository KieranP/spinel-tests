# frozen_string_literal: true

require 'tmpdir'

require_relative 'base'
require_relative '../errors'
require_relative '../source'

module SpinelCheck
  module Commands
    # Which INDIVIDUAL form of a report still fails?
    #
    # `verify` answers "is this report fixed?" by activating every form at once, which is
    # the right question for a delete decision but the wrong one for writing a follow-up
    # report: a single verdict over a dozen forms does not say WHICH line still reproduces.
    #
    # This runs the file once per commented form — each time with the rest of the file
    # untouched, so shared setup (`require`s, class definitions, fixtures) stays in place —
    # and prints a verdict per line. That is what a partially-fixed report needs before it
    # can be re-filed: the exact line that still diverges, and what it now prints.
    class Forms < Base
      def call(paths)
        files = Repo.expand(paths, default: 'bugs')
        raise Error, 'forms: no .rb files found' if files.empty?

        sources = files.to_h { |path| [path, File.readlines(path)] }
        # Every form of every file in ONE sweep, so the bar counts real work and forms from
        # different files fill idle workers instead of waiting their turn.
        work = files.flat_map { |path| candidates(sources[path]).map { |form| [path, form] } }

        results = sweep(work, label: 'forms', tick: ->((path, _)) { File.basename(path) }) do |(path, form)|
          [path, form, run(form, path)]
        end

        # `results` keeps input order and group_by keeps insertion order, so files print in
        # the order asked for and forms in file order.
        results.group_by(&:first).each do |path, rows|
          puts path
          rows.each { |_, form, outcome| print_row(form, outcome, sources[path]) }
        end
      end

      private

      Candidate = Data.define(:run, :source)
      private_constant :Candidate

      # What running one form produced. A nil comparison means the activation did not parse,
      # so nothing was run — kept as one type rather than a Symbol-or-Comparison union the
      # callers had to keep type-testing.
      Outcome = Data.define(:comparison) do
        def unparseable? = comparison.nil?
        def clean?       = !unparseable? && comparison.clean?

        def token
          return 'PARSE?' if unparseable?

          clean? ? 'OK' : comparison.status
        end
      end
      private_constant :Outcome

      # Row 0 is the file exactly as committed (the primary repro); the rest each activate
      # ONE whole comment run.
      def candidates(lines)
        [Candidate.new(run: nil, source: lines)] +
          Source::Activation.comment_runs(lines).map do |run|
            Candidate.new(run: run, source: Source::Activation.activate_run(lines, run))
          end
      end

      # An unparseable activation is reported, never silently tested as-is: the whole point
      # here is per-line attribution, and falling back would attribute the file's verdict to
      # a line that never ran.
      def run(candidate, path)
        text = candidate.source.join
        return Outcome.new(comparison: nil) unless Source.parses?(text)

        Dir.mktmpdir do |dir|
          tmp = File.join(dir, File.basename(path))
          File.write(tmp, text)
          Outcome.new(comparison: compare(tmp))
        end
      end

      def print_row(candidate, outcome, lines)
        puts format('  %-9s %s  %s', label(candidate.run), status(outcome.token, width: 6),
                    code(candidate.run, lines)[0, 106])
        failure(outcome.comparison, ' ' * 11) unless outcome.unparseable? || outcome.clean?
      end

      def label(run)
        return 'as-is' if run.nil?

        run.size > 1 ? "L#{run.first + 1}-#{run.last + 1}" : "L#{run.first + 1}"
      end

      def code(run, lines)
        return '(primary, as committed)' if run.nil?

        run.map { |index| lines[index].strip.sub(/^#\s?/, '') }
           .select { |text| Source::Classifier.code?(text) }
           .join('; ')
      end
    end
  end
end
