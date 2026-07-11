# frozen_string_literal: true

require 'set'

require_relative 'base'
require_relative '../source'

module SpinelCheck
  module Commands
    # Un-comment and un-tag a FIXED report's test lines, in place.
    #
    # Every transformed file is parse-checked BEFORE it is written, and the bad ones are
    # refused — left exactly as they were and listed for a manual tag fix. A mis-transform
    # must never be able to corrupt a test file, and activation works from comment text, so
    # a mis-tagged prose line can always slip past the classifier.
    class Activate < Base
      def call(ids)
        wanted = ids.to_set
        changed, rejected = [], []

        Dir.glob(Repo::TESTS_GLOB).sort.each do |path|
          source = File.readlines(path)
          next unless tagged?(source, wanted)

          activated = Source::Activation.for_ids(source, wanted)
          next if activated == source

          text = activated.join
          if Source.parses?(text)
            File.write(path, text)
            changed << path
          else
            rejected << path
          end
        end

        report(ids, changed, rejected)
      end

      private

      def tagged?(source, wanted)
        source.any? { |line| (id = line[Source::INLINE_TAG, 1]) && wanted.include?(id) }
      end

      def report(ids, changed, rejected)
        puts "Activated #{ids.join(', ')} in #{changed.size} files:"
        changed.each { |path| puts "  #{path}" }

        unless rejected.empty?
          puts "\n⚠ #{rejected.size} file(s) left UNCHANGED — activation produced invalid Ruby"
          puts '  (a mis-tagged comment was uncommented). Fix the # BUG tags by hand:'
          rejected.each { |path| puts "  #{path}" }
        end

        puts "\nVerify with: #{COMMAND} regression"
      end
    end
  end
end
