# frozen_string_literal: true

require 'prism'

require_relative 'source/classifier'
require_relative 'source/activation'

module SpinelCheck
  # Reading and rewriting the `# BUG <id>` / `# WONTFIX` tags that link a report to the
  # test lines it owns.
  module Source
    # A whole-line section header introducing a block of commented forms.
    SECTION_HEADER = /^\s*#\s*BUG (\d+)\b/
    # The tag riding on the end of a single tagged line.
    INLINE_TAG = /# BUG (\d+)/
    # What `regression` quotes to say why a divergent file is already known.
    ANY_TAG = /# BUG \d+|# WONTFIX/

    module_function

    def section_header_id(line) = line[SECTION_HEADER, 1]

    # An inline tag is a tag that is NOT the whole-line section header form.
    def inline_tag_id(line)
      return nil if line.match?(SECTION_HEADER)

      line[INLINE_TAG, 1]
    end

    def tagged?(line, id) = line.match?(/# BUG #{id}\b/)

    # Does this source parse as valid Ruby?
    #
    # Activation uncomments lines it judges code-ish, and a mis-tagged prose comment can
    # still slip through — so every result is checked before it is written or run, and the
    # bad ones are refused rather than left behind as a file that will not even parse.
    #
    # Prism is CRuby's own parser, so this agrees with `ruby -c` while costing no fork and
    # no temp file (this used to be a `Dir.mktmpdir` plus a subprocess, per check).
    def parses?(text) = Prism.parse(text).success?
  end
end
