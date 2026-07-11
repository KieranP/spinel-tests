# frozen_string_literal: true

require_relative 'errors'
require_relative 'source'

module SpinelCheck
  # Where the reports and the test suite live, and which of them belong to which report.
  #
  # A report is two files sharing a `<ID>_slug` stem — `bugs/<ID>_slug.md` (the write-up)
  # and `bugs/<ID>_slug.rb` (the smallest standalone repro) — plus at least one `tests/`
  # line tagged `# BUG <ID>`.
  module Repo
    BUGS_GLOB  = 'bugs/*.rb'
    TESTS_GLOB = 'tests/**/*.rb'

    # Built at load, not lazily: `@mutex ||= Mutex.new` is itself unsynchronised, so the
    # threads it is meant to coordinate can race to create it.
    INDEX_MUTEX = Mutex.new
    NO_FILES = [].freeze
    private_constant :INDEX_MUTEX, :NO_FILES

    module_function

    def bug_repros = Dir.glob(BUGS_GLOB).sort

    def ids = bug_repros.map { |path| id_for(path) }

    # bugs/<ID>_slug.rb -> <ID>. Older reports use short sequential `N_slug` stems, and a
    # stem with no underscore falls back to the whole basename.
    def id_for(path) = File.basename(path)[/\A(\d+)_/, 1] || File.basename(path, '.rb')

    def repro_for(id) = Dir.glob("bugs/#{id}_*.rb").first

    def test_files_for(id) = tag_index.fetch(id, NO_FILES)

    # Every tagged test file, indexed by report id.
    #
    # Built ONCE and shared. Asking each report to scan the suite for its own tag meant
    # re-reading all ~2600 test files per report, which dominated the runtime of `verify
    # all` and `triage` — with ~80 reports that is over 200k file reads for one sweep.
    def tag_index
      INDEX_MUTEX.synchronize { @tag_index ||= build_tag_index }
    end

    # Test seam: the index is memoized for the life of the process, which is right for a CLI
    # run but wrong for a suite that builds several fixture corpora in one process.
    def reset! = INDEX_MUTEX.synchronize { @tag_index = nil }

    def build_tag_index
      index = {}
      Dir.glob(TESTS_GLOB).sort.each do |path|
        File.read(path).scan(Source::INLINE_TAG).flatten.uniq.each do |id|
          (index[id] ||= []) << path
        end
      end
      # Frozen, and no default proc: this is shared across every worker thread, and a
      # default proc would make a plain read of an unknown id silently insert into it.
      index.each_value(&:freeze).freeze
    end

    # Expand command arguments into a list of .rb files: a directory contributes every .rb
    # beneath it, anything else is taken as a path.
    #
    # A path that does not exist is an error, not a silent pass-through. Left unchecked, a
    # typo reached the toolchains as a missing file, where BOTH sides print nothing to
    # stdout and so "match" — a typo reported as a pass.
    def expand(paths, default:)
      requested = paths.empty? ? Array(default) : paths
      missing = requested.reject { |path| File.exist?(path) }
      raise Error, "no such file or directory: #{missing.join(', ')}" if missing.any?

      requested.flat_map { |path| File.directory?(path) ? Dir.glob("#{path}/**/*.rb").sort : [path] }
    end

    private_class_method :build_tag_index
  end
end
