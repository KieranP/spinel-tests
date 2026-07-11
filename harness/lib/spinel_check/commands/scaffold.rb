# frozen_string_literal: true

require_relative 'base'
require_relative '../errors'

module SpinelCheck
  module Commands
    # Mint an ID and write the `bugs/<ID>_<slug>.{md,rb}` skeleton.
    #
    # The ID is a creation timestamp, not a sequence number, so parallel agents filing at
    # the same time never collide. Millisecond precision is required — second resolution is
    # not enough when fanning out. It goes in the two filenames and in the `# BUG <ID>` test
    # tags, and NOWHERE else: a report is identified by its stem, never by a number in its
    # title.
    class Scaffold < Base
      KINDS = %w[Compiler Runtime].freeze

      DISCLAIMER =
        '> (Disclaimer: I asked Claude Opus 5 (high) to find Spinel compile/runtime issues ' \
        'with documented Ruby classes and methods. It found the following issue, which ' \
        'I manually verified for accuracy before publishing this report)'

      def call(slug, kind)
        raise Error, "kind must be one of: #{KINDS.join(' | ')}" unless KINDS.include?(kind)

        id   = Time.now.strftime('%Y%m%d%H%M%S%L')
        stem = "bugs/#{id}_#{slug}"
        raise Error, "#{stem}.md already exists" if File.exist?("#{stem}.md")

        File.write("#{stem}.md", write_up(kind))
        File.write("#{stem}.rb", "# repro for #{id} — smallest standalone repro; secondary forms in comments\n")

        puts "Created #{stem}.md"
        puts "Created #{stem}.rb"
        puts "Tag every test line:  # BUG #{id} - [cause]"
      end

      private

      # The ID is deliberately absent: a report is identified by its filename stem, never by
      # a number in its title.
      def write_up(kind)
        <<~MARKDOWN
          # [#{kind}] TITLE

          #{DISCLAIMER}

          _Reproduced with `spinel #{spinel_revision}` vs `ruby #{RUBY_VERSION}`._

          DESCRIPTION — 2–3 lines of observed behaviour only (no internals, no severity).

          ## Repro

          ```ruby
          # smallest standalone repro
          ```

          Ruby #{RUBY_VERSION[/\A\d+/]}:

          ```
          RUBY OUTPUT
          ```

          Spinel: #{kind == 'Compiler' ? 'compile abort (see below).' : 'WRONG OUTPUT'}
          #{compile_section(kind)}
        MARKDOWN
      end

      def compile_section(kind)
        return '' unless kind == 'Compiler'

        <<~SECTION

          ## Compile error

          ```
          PASTE VERBATIM SPINEL COMPILE OUTPUT
          ```
        SECTION
      end

      # Spawned as an argument list, not through a shell: interpolating the path into a
      # backtick string meant any space in it (SPINEL_BIN=/opt/my spinel/bin/spinel) made the
      # command silently fail, and 'REV' was then written into the report's version line as
      # if it were a fact. A missing toolchain still degrades to 'REV' — scaffolding a report
      # must not require a working compiler.
      def spinel_revision
        IO.popen([config.spinel, '--version'], err: File::NULL, &:read)[/spinel\s+(\S+)/, 1] || 'REV'
      rescue StandardError
        'REV'
      end
    end
  end
end
