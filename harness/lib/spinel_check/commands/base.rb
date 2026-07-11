# frozen_string_literal: true

require_relative '../comparison'
require_relative '../pool'
require_relative '../progress'
require_relative '../repo'
require_relative '../verifier'

module SpinelCheck
  module Commands
    # Shared plumbing: the wiring, the worker pool, and the printing shorthands.
    class Base
      def self.call(context, ...) = new(context).call(...)

      def initialize(context)
        @context  = context
        @config   = context.config
        @runner   = context.runner
        @reporter = context.reporter
      end

      private

      attr_reader :context, :config, :runner, :reporter

      # The one way work is fanned out: bounded concurrency, input order preserved, and a
      # progress bar. Every sweeping command goes through here so none of them can look
      # hung while the others show progress.
      #
      # `tick` turns an item into the label shown on the bar; omit it for work whose items
      # have no useful short name.
      def sweep(items, label:, tick: nil)
        Progress.track(items.size, label: label) do |bar|
          pmap(items) do |item|
            result = yield(item)
            bar.advance(tick&.call(item))
            result
          end
        end
      end

      def pmap(items, &) = Pool.map(items, jobs: config.jobs, &)

      def compare(path) = Comparison.of(path, runner)

      def verifier = @verifier ||= Verifier.new(runner: runner)

      def puts(text = '') = reporter.puts(text)

      def status(token, width: 0) = reporter.status(token, width: width)

      def failure(comparison, indent) = reporter.failure(comparison, indent)

      # Qualifications on a verdict — printed beside the row they belong to, whatever the
      # verdict was. A caveat on a FIXED row is the dangerous one: it means the verdict may
      # be a false pass, and FIXED is what licenses deleting the report.
      def caveats(verdict, indent) = verdict.caveats.each { |text| reporter.caveat(text, indent) }

      def peak_note(peak_mb) = reporter.peak_note(peak_mb)

      def summary(headline, counts) = reporter.summary(headline, counts)

      # `<class>/<method>.rb` — enough to place a file without the full path.
      def short_label(path) = File.join(File.basename(File.dirname(path)), File.basename(path))
    end
  end
end
