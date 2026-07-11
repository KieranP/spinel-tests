# frozen_string_literal: true

require 'thor'

require_relative 'context'
require_relative 'errors'
require_relative 'commands/activate'
require_relative 'commands/env'
require_relative 'commands/forms'
require_relative 'commands/memtop'
require_relative 'commands/recheck'
require_relative 'commands/regression'
require_relative 'commands/scaffold'
require_relative 'commands/triage'
require_relative 'commands/verify'

module SpinelCheck
  # The command surface.
  #
  # Workflow: `triage` -> run its FIXED block -> for PARTIAL and new findings, `scaffold`
  # and fill in.
  class CLI < Thor
    class_option :jobs,    type: :numeric, aliases: '-j', desc: 'Concurrent jobs (SPINEL_JOBS)'
    class_option :timeout, type: :numeric, aliases: '-t', desc: 'Seconds per process (SPINEL_TIMEOUT)'

    def self.exit_on_failure? = true

    # Thor ships an inherited `tree` command; it is noise in a listing this small.
    remove_command :tree if all_commands.key?('tree')

    # Usage lines must be directly runnable. Thor's default basename is $0's basename
    # ('spinel-check'), which is not on PATH — the harness is invoked by its path.
    def self.basename = COMMAND

    def self.banner(command, _namespace = nil, _subcommand = false)
      "#{basename} #{command.usage}"
    end

    desc 'triage', 'Per-build sweep: recheck -> auto-verify the candidates -> classify'
    long_desc <<~DESC
      Start every build here. It runs the cheap primary-repro scan over every report, then
      the full multi-form verify on ONLY the reports whose primary now passes, and prints
      one grouped verdict each:

        FIXED    every form compiles clean and matches  -> activate + delete
        PARTIAL  primary passes, a variant still fails  -> delete the report, file a new one
        BROKEN   primary repro still diverges           -> leave it alone

      Every non-FIXED verdict prints its ruby-vs-spinel diff and compile diagnostic inline,
      so a divergence that has CHANGED — an abort that became a runtime error, output that
      now matches but still warns — is visible rather than lumped in with the unchanged.

      It never deletes anything: FIXED rows come with a ready-to-run activate + rm block.
    DESC
    def triage = Commands::Triage.call(context)

    desc 'recheck', "Fast scan: which reports' primary repros still diff?"
    long_desc <<~DESC
      Runs each report's primary repro exactly as committed. A MATCH means the primary
      symptom is gone AND the repro compiles clean — but the secondary forms and the tagged
      tests/ lines are untested, so it is a candidate, not a verdict. Confirm with `verify`
      before deleting anything.
    DESC
    def recheck = Commands::Recheck.call(context)

    desc 'verify [ID|all]', 'Slow confirm: is a report actually fixed?'
    long_desc <<~DESC
      Activates EVERY form of a report — the secondary and compile-abort variants commented
      out in bugs/<ID>_*.rb, plus every tagged tests/ line — and reports FIXED only when all
      of them compile CLEAN (no warnings) and match. This is the authoritative verdict, and
      the only safe basis for deleting a report.

      A shared tests/ file often co-hosts other open bugs, so it may diverge no matter what.
      Such a file is judged by THIS report's contribution: activating the ID fails it only if
      that changes the file's divergence or diagnostic level.
    DESC
    def verify(id = nil) = Commands::Verify.call(context, id)

    desc 'regression [DIR]', 'Diff a whole suite dir (default: tests), triaged by tag'
    def regression(dir = nil) = Commands::Regression.call(context, dir)

    desc 'forms [PATH...]', 'Which individual form of a report still fails? (default: bugs/)'
    long_desc <<~DESC
      Runs a report's file once per commented form, with the rest of the file untouched so
      requires and fixtures stay in place, and prints a verdict per line. That is what a
      partially-fixed report needs before it can be re-filed: the exact line that still
      diverges, and what it now prints.
    DESC
    def forms(*paths) = Commands::Forms.call(context, paths)

    desc 'activate ID [ID...]', 'Un-comment + un-tag a FIXED report'"'"'s tests'
    long_desc <<~DESC
      Parse-checks every transformed file before writing it, and refuses the bad ones —
      leaving them unchanged and listing them for a manual tag fix, so a mis-transform can
      never corrupt a test file.
    DESC
    def activate(*ids)
      raise Error, 'activate needs at least one ID' if ids.empty?

      Commands::Activate.call(context, ids)
    end

    desc 'scaffold SLUG [KIND]', 'Mint an ID + write the bugs/<ID>_SLUG.{md,rb} skeleton'
    def scaffold(slug, kind = 'Compiler') = Commands::Scaffold.call(context, slug, kind)

    desc 'memtop [PATH...]', 'Rank files by peak memory, worst first (default: bugs/)'
    long_desc <<~DESC
      What a MEMORY row was about. Peaks are sampled, so treat them as close-enough. For
      clean attribution run one file at a time:

        SPINEL_JOBS=1 SPINEL_MAXRSS=8192 #{COMMAND} memtop <file>
    DESC
    def memtop(*paths) = Commands::Memtop.call(context, paths)

    desc 'env', 'Show the resolved settings and which variable sets each'
    def env = Commands::Env.call(context)

    # Not a command — Thor would otherwise register any public method as one.
    no_commands do
      # Single dispatch point for every command, so the cleanup cannot be forgotten on one.
      #
      # Every job runs in its OWN process group, which means a Ctrl-C at the terminal reaches
      # only this process: each spinel and each compiled binary it spawned survives as an
      # orphan, burning CPU and skewing the timings of whatever runs next. Sweeping them here
      # is what removes the manual `pkill -9 -f spinel_run_` step after an interrupted sweep.
      def invoke_command(...)
        super
      rescue Interrupt, SignalException
        @context&.guard&.stop!
        raise
      end
    end

    private

    # Built once per invocation, from the environment plus any --jobs/--timeout override.
    # Commands run relative to the CORPUS root, so their globs (bugs/*.rb, tests/**/*.rb)
    # resolve the same way wherever the harness was invoked from.
    def context
      @context ||= begin
        Dir.chdir(SpinelCheck.corpus_root)
        Context.build(SpinelCheck.corpus_root, env: environment)
      end
    end

    def environment
      ENV.to_h.merge(
        { 'SPINEL_JOBS' => options[:jobs]&.to_s, 'SPINEL_TIMEOUT' => options[:timeout]&.to_s }.compact
      )
    end
  end
end
