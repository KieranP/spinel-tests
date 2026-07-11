# frozen_string_literal: true

# Harness for the Spinel bug-hunt recheck/regression loop: run valid Ruby under both `ruby`
# and Spinel and compare.
#
# Two things about that comparison are load-bearing, and both are lessons from getting it
# wrong (see CLAUDE.md):
#
#   * STDOUT drives the value compare, and stderr is NEVER folded into it — `2>&1` yields
#     false DIFFs. But stderr IS inspected separately, because a C-compiler `warning:` or
#     `error:` is a bug even when stdout matches: Spinel must never emit ill-typed C. The
#     subtlety is that the compiled binary's own runtime exceptions land on stderr too, and
#     those are not compile diagnostics — Diagnostic matches only compiler markers so a
#     runtime raise is not double-counted, the stdout diff already covers it.
#
#   * Test paths are never word-split or globbed through a shell: filenames here are
#     literal operator names, so `?`, `<`, `>`, `%`, `!`, `[`, `=` all appear in them.
module SpinelCheck
  # How to invoke the harness, relative to the corpus root that commands run in.
  #
  # One source of truth: this is Thor's usage banner AND every copy-pasteable command the
  # tool prints (triage's activate block, activate's verify hint, the memory footer). Those
  # are meant to be pasted, so a second spelling anywhere is a latent wrong instruction.
  COMMAND = 'harness/bin/spinel-check'

  # The harness lives in `harness/`; the corpus it studies — bugs/, tests/, samples/ — is its
  # parent. Commands run relative to the CORPUS root, so their globs resolve the same way
  # wherever the harness was invoked from. (The harness's own root is not needed here: the
  # bin stub derives it from its own path, before this file is even loaded.)
  def self.corpus_root = @corpus_root ||= File.expand_path('../..', __dir__)
end

# Requires come AFTER the constants above: `long_desc` heredocs in the CLI interpolate
# COMMAND at class-definition time, so it has to exist before cli.rb is loaded.
require_relative 'spinel_check/errors'
require_relative 'spinel_check/cli'
