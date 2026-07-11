# frozen_string_literal: true

module SpinelCheck
  module Source
    # Turning a report's commented-out forms back into live code.
    #
    # `verify` does this in a temp copy to ask "is every form fixed?"; `activate` does it in
    # place once a report is confirmed FIXED. Both go through here so the two can never
    # disagree about what activating a report means.
    module Activation
      # Strips one leading `#` (and its single following space) from a comment.
      UNCOMMENT = /^(\s*)#\s?/
      # A comment whose body is non-blank, split into indent and body. The body keeps its
      # own leading whitespace: a commented-out `class` block indents its members
      # (`#   attr_reader :value`), and demanding a non-space right after the `#` left
      # every such member commented while the `class` / `end` lines around it went live —
      # an empty class whose method calls then bound to a builtin of the same name.
      COMMENT_BODY = /^(\s*)#\s?(?=\s*\S)(.*)$/

      module_function

      # The file with `ids`' forms activated:
      #   * inline-tagged code lines (`code  # BUG <id> …`) are uncommented and untagged
      #   * section headers (`# BUG <id> …` alone on the line) are dropped, their block's
      #     commented CODE lines uncommented, and header-continuation PROSE kept as a
      #     comment — never dropped, so a code line the classifier fails to recognise is
      #     never silently lost.
      # Lines belonging to other ids are left exactly as they are.
      def for_ids(lines, ids)
        out = []
        index = 0
        while index < lines.length
          line = lines[index]
          if (id = Source.section_header_id(line)) && ids.include?(id)
            index = activate_section(lines, index + 1, ids, out)
          elsif (id = Source.inline_tag_id(line)) && ids.include?(id)
            activate_inline(line, out)
            index += 1
          else
            out << line
            index += 1
          end
        end
        out
      end

      # The file with `id`'s CONTRIBUTION removed — the baseline an activated file is
      # compared against. Any LIVE line carrying an inline `# BUG <id>` tag is commented
      # out; already-commented blocks are inert and pass through untouched.
      #
      # This is what lets a report whose tagged line is live (a runtime value difference) be
      # judged by whether that line diverges, rather than being masked because the same
      # divergence sits in both the activated file and the file as-is.
      def neutralize(lines, id)
        lines.map { |line| Source.tagged?(line, id) && !line.match?(/\A\s*#/) ? "# #{line}" : line }
      end

      # Uncomment every code-ish commented line — all of a bug repro's secondary forms at
      # once. Used on `bugs/<id>_*.rb`, which has no co-hosted reports to preserve.
      def uncomment_all(lines)
        lines.map do |line|
          match = line.match(COMMENT_BODY)
          match && !match[2].lstrip.start_with?('BUG ') && Classifier.code?(match[2]) ? "#{match[1]}#{match[2]}\n" : line
        end
      end

      # The commented-out forms in a file, as maximal RUNS of consecutive comment lines
      # (a blank or live line ends a run).
      #
      # A run, not a line: a secondary form is often a multi-line `class … end` / `def … end`
      # block, and uncommenting one line of it either fails to parse or — worse — leaves the
      # definition commented while activating the call, so BOTH toolchains fail identically
      # and the form reads as clean. That false OK is exactly what a single-line probe once
      # reported for a report whose every form was still broken.
      def comment_runs(lines)
        runs = []
        current = []
        lines.each_index do |index|
          if lines[index].match?(/^\s*#/) && !lines[index].match?(Source::SECTION_HEADER)
            current << index
          else
            runs << current if holds_code?(lines, current)
            current = []
          end
        end
        runs << current if holds_code?(lines, current)
        runs
      end

      # Uncomment the code-ish lines of `run`, leaving the rest of the file untouched — so
      # shared setup (`require`s, class definitions, fixtures) stays in place.
      def activate_run(lines, run)
        lines.each_with_index.map do |line, index|
          run.include?(index) && Classifier.code?(uncommented(line)) ? line.sub(UNCOMMENT, '\1') : line
        end
      end

      def uncommented(line) = line.sub(UNCOMMENT, '')

      def holds_code?(lines, run)
        run.any? { |index| Classifier.code?(uncommented(lines[index])) }
      end

      # --- internals ----------------------------------------------------------------

      # Consume a section block, appending its activated lines to `out`; returns the index
      # of the line that ended it.
      def activate_section(lines, index, ids, out)
        while index < lines.length
          line = lines[index]
          break if line.strip.empty?

          if (id = Source.section_header_id(line))
            break unless ids.include?(id) # another report's block starts here — leave it

            index += 1 # a continuation header of our own — drop it
            next
          end

          out << uncomment_code(line)
          index += 1
        end
        index
      end

      def uncomment_code(line)
        match = line.match(/^(\s*)#\s?(.*)$/)
        match && Classifier.code?(match[2]) ? "#{match[1]}#{match[2]}\n" : line
      end

      def activate_inline(line, out)
        untagged = "#{line.sub(/\s*# BUG \d+\b.*$/, '').rstrip}\n"
        match = untagged.match(COMMENT_BODY)
        out << (match ? "#{match[1]}#{match[2]}\n" : untagged)
        backfill_fixtures(out) if match
      end

      # If the tagged form was COMMENTED, the fixture it needs may sit on preceding
      # commented lines that carry no tag of their own. Uncommenting the call but not the
      # fixture leaves the file raising NameError under BOTH toolchains — it happened here:
      # activating `select(&EVEN045)` while `EVEN045 = ->(x) { … }` stayed commented, and
      # the file then "matched" only because both sides were equally broken.
      #
      # So walk back over the contiguous commented run and activate its DEFINITION lines.
      # Never a print: a sibling probe line is not a dependency, and activating it would
      # silently widen the change.
      def backfill_fixtures(out)
        index = out.length - 2
        while index >= 0
          match = out[index].match(COMMENT_BODY)
          break unless match

          body = match[2]
          break if body.lstrip.start_with?('BUG ')
          break if Classifier.print?(body)
          break unless Classifier.code?(body)

          out[index] = "#{match[1]}#{body}\n"
          index -= 1
        end
      end

      private_class_method :activate_section, :uncomment_code, :activate_inline, :backfill_fixtures
    end
  end
end
