# frozen_string_literal: true

require 'diff-lcs'
require 'diff/lcs/hunk'

module SpinelCheck
  # How ruby's and spinel's stdout differ, computed in-process.
  #
  # This used to shell out to `diff` via a temp dir, once per divergent file. Forking is
  # exactly what starts failing when a sweep is under memory pressure, which is when these
  # diffs matter most — so it is done here instead. `text` is byte-identical to `diff`'s
  # default output format, which is what the reports have always shown.
  #
  # (`::Diff` is diff-lcs's own top-level namespace — hence the name here.)
  module Divergence
    module_function

    # Classic `diff` text ('' when identical).
    def text(before, after)
      return '' if before == after

      old_lines = before.lines
      new_lines = after.lines
      offset = 0
      ::Diff::LCS.diff(old_lines, new_lines).map { |piece|
        hunk = ::Diff::LCS::Hunk.new(old_lines, new_lines, piece, 0, offset)
        offset = hunk.file_length_difference
        hunk.diff(:old).to_s
      # `before`/`after` are byte-faithful stdout and may hold non-UTF-8 bytes. The `==`
      # decision was already made on the raw bytes; this text only ever feeds display.
      }.join.scrub
    end

    # The divergent CONTENT, with no line numbers — so it is STABLE when unrelated
    # insertions elsewhere in a file shift them. Used to test whether ACTIVATING a report
    # changed a shared test file's divergence, as opposed to a co-hosted bug's divergence
    # that was already there. Compared for equality only, so the shape just has to be
    # deterministic.
    def changes(before, after)
      return [] if before == after

      ::Diff::LCS.diff(before.lines, after.lines)
                 .flat_map { |piece| piece.map { |change| [change.action, change.element] } }
    end
  end
end
