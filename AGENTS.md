# Spinel bug-hunt prompt

Find bugs in **Spinel** (a Ruby→C compiler) by running valid Ruby under both `ruby` and
Spinel and comparing output. Reusable — hand this whole file to the agent to re-run the
exercise.

- Reference: `ruby <file.rb>` · Spinel: `~/spinel/bin/spinel -E <file.rb>`
- Always diff with process substitution: `diff <(ruby f) <(~/spinel/bin/spinel -E f)`.
  Never `echo "$captured"` a captured string — the trailing newline causes false DIFFs.
- Compare **stdout only** — folding stderr in (`2>&1`) flags fixed bugs as DIFFs. Check
  stderr *separately*: a compile `warning:`/`error:` is a bug even when stdout matches.

**What runs when.** Reverifying the existing reports is the **only** automatic step, at the
start of every build. Running the regression suite and growing the test suite happen **only
when the maintainer asks**.

## Tooling: `harness/bin/spinel-check`

Prefer this over hand-rolling the loop: it compares stdout only, is safe with operator
filenames (`? < > % ! [ =`), runs in parallel, and kills any process after `SPINEL_TIMEOUT`
seconds (default 30), reported as `[TIMEOUT]` — a DIFF — so a compile-then-infinite-loop
repro can't hang an unattended run.

**The harness lives in `harness/`** — `bin/`, `lib/`, `test/`, `Gemfile`, `Rakefile` — so the
repo root stays pure corpus (`bugs/`, `samples/`, `tests/`). Setup, once per checkout:
`cd harness && bundle install`. The command may then be run from anywhere; it resolves the
corpus relative to itself, not to `$PWD`.

    harness/bin/spinel-check                  # command list
    harness/bin/spinel-check help <command>   # one command's detail
    harness/bin/spinel-check env              # resolved settings + which env var sets each

Its own unit tests are `cd harness && bundle exec rake test` — run them after touching
`harness/lib/`.

**Memory guard.** A wall clock alone isn't enough: a runaway compile can eat all of RAM in a
few seconds, and a `triage` run once swapped the whole machine to a standstill. Every job runs
in its own process group under a resident-set cap; crossing it — or the sweep-wide ceiling —
gets the group killed and reported as `MEMORY`, a failure, never a pass. Concurrency is derived
from the memory budget as well as the core count, so the per-job caps can never sum to more RAM
than the box has. Knobs: `SPINEL_MAXRSS` (MB/job, default 2048), `SPINEL_MAXRSS_TOTAL` (MB for
the whole sweep, default 60% of RAM), `SPINEL_JOBS`, `SPINEL_MEM_POLL` (default 0.3s). This is
policed from outside the child because macOS can't do it from within — `setrlimit(RLIMIT_AS)`
and `RLIMIT_DATA` both return `EINVAL` on Darwin, so `ulimit -v` and
`Process.spawn(rlimit_as:)` are unavailable. A `MEMORY` row names the file; `memtop` ranks
files by peak RSS to identify a hog, most precisely one file at a time:
`SPINEL_JOBS=1 SPINEL_MAXRSS=8192 harness/bin/spinel-check memtop <file>`. Peaks come from sampling, so
they're close-enough, not exact. For reference, every `bugs/*.rb` repro peaks under ~110MB — a
job in the gigabytes is a finding worth reporting, not normal compiler appetite. The budget is
**per `spinel-check` process**: two concurrent runs each get the full ceiling and together can
blow past it, so give the second one a smaller `SPINEL_JOBS`/`SPINEL_MAXRSS`.

`harness/bin/spinel-check forms [PATH…]` answers the question `verify` can't: **which individual form
still fails?** It runs a report's file once per commented form (the rest of the file untouched,
so `require`s and fixtures stay in place) and prints a verdict per line. That's what a
partially-fixed report needs before it can be re-filed — the exact line that still diverges and
what it now prints.

    harness/bin/spinel-check triage             # per-build sweep: recheck→auto-verify→classify
    harness/bin/spinel-check recheck            # fast scan: which primary repros still diff?
    harness/bin/spinel-check verify [ID|all]    # slow confirm: is a report actually fixed?
    harness/bin/spinel-check regression [DIR]   # diff a whole suite dir, triaged by tag
    harness/bin/spinel-check activate ID [ID…]  # un-comment + un-tag a FIXED report's tests
    harness/bin/spinel-check scaffold SLUG [kind]  # mint ID + write bugs/<ID>_SLUG.{md,rb} skeleton
    harness/bin/spinel-check memtop [PATH…]     # rank files by peak memory (spinel vs ruby), worst first

**Start each build with `triage`** — the whole reverify loop in one command: the cheap
primary-repro scan over every report, then `verify` on only the candidates whose primary now
passes. `verify` checks *every* form (secondary and commented-out compile-abort variants, plus
each tagged `tests/` line, temporarily uncommented), so it — not `recheck` — is the
authoritative verdict and the only safe basis for deleting. One verdict per report:

- `FIXED` — every form compiles clean *and* matches. Emits a ready-to-run `activate` + `rm`
  block (the script never deletes for you).
- `PARTIAL` — primary passes, a variant still fails. Delete the old report and file a **new**
  one for the remainder; activate the passing lines, retag the rest.
- `BROKEN` — primary still diverges. Leave the report and its tags alone.

Non-FIXED verdicts print the diff and compile diagnostic inline (capped at 8 lines / 200
cols), so a divergence that has *changed* — an abort that became a runtime error, output that
now matches but still warns — is visible rather than lumped in with the unchanged.

`activate` **refuses to write unparseable Ruby**: it parse-checks each transformed file and,
rather than corrupt one, leaves it unchanged under a `⚠` block for a manual tag fix.
`scaffold` mints the ID into the two filenames and pre-fills both (title — `[Kind]` only, no
ID — verbatim disclaimer, current `spinel`/`ruby` version line, `## Repro`, and `## Compile
error` for `Compiler`); `kind` = `Compiler` (default) | `Runtime`.

Workflow: `triage` → run its FIXED block → for PARTIAL/new findings, `scaffold` + fill in.

To inspect a hang-prone repro by hand, use a hard timeout:
`~/spinel/bin/spinel r.rb -o /tmp/b && perl -e 'alarm 8; exec @ARGV' /tmp/b`.

## Running the regression suite

Serial is far too slow (~1000 files, each a full C compile) — fan out across cores. Prefer
`harness/bin/spinel-check regression [DIR]`, which already handles stdin, timeouts, tagging and the
memory cap. The raw loop below is for a one-off variant — note it has **no memory guard**, so
one runaway compile can still wedge the machine; it takes the dir as `$SWEEP_DIR`, so the same
command sweeps `tests` or `samples`, and prints one `DIFF`/`TIMEOUT` line per divergence with
the file's first `# BUG`/`# WONTFIX` tag (or `UNTAGGED`) for immediate triage:

    SWEEP_DIR=tests   # or: samples
    find "$SWEEP_DIR" -name '*.rb' | sort | xargs -P "$(sysctl -n hw.ncpu)" -I{} bash -c '
      f="$1"; to=${SPINEL_TIMEOUT:-45}
      # Run in its OWN process group, capture to a FILE, kill the group afterwards.
      run() {
        local out=$1; shift
        set -m
        "$@" </dev/null >"$out" 2>/dev/null &
        local p=$!
        ( sleep "$to"; kill -9 -"$p" 2>/dev/null ) 2>/dev/null &
        local w=$!
        wait "$p" 2>/dev/null; local rc=$?
        kill -9 -"$p" 2>/dev/null          # reap spinel-s surviving compiled binary
        kill "$w" 2>/dev/null; wait "$w" 2>/dev/null
        [ $rc -ge 128 ] && rc=142
        return $rc
      }
      ro=$(mktemp); so=$(mktemp)
      run "$ro" ruby "$f";                   rs=$?
      run "$so" ~/spinel/bin/spinel -E "$f"; ss=$?
      tag=$(grep -oE "# BUG [0-9]+|# WONTFIX" "$f" | head -1)
      if [ $rs -eq 142 ] || [ $ss -eq 142 ]; then echo "TIMEOUT  $f    [${tag:-UNTAGGED}]"
      elif ! cmp -s "$ro" "$so"; then echo "DIFF  $f    [${tag:-UNTAGGED}]"; fi
      rm -f "$ro" "$so"
    ' _ {}

Three non-obvious requirements — all three have actually bitten, and each failure looks
identical to "a compile is stuck in a loop":

- **Every child needs `</dev/null`.** Some files read stdin (`gets`, `$stdin.read`, `ARGF`),
  and BSD `xargs` children *inherit `xargs`' stdin* — the pipe carrying the remaining file
  list. One such file blocks forever **and** eats the list, so the sweep prints a line or two
  then idles with most worker slots empty. Both sides get the same empty stdin, so `gets`→nil
  still compares faithfully. Do **not** redirect `xargs` itself (`' _ {} </dev/null`) — that
  starves the file list and the sweep silently does nothing at all.
- **Capture to a file, never `$(…)`, and kill the process group.** `spinel -E` *runs the C
  binary it just built*, and that binary inherits the capture pipe; if it outlives spinel,
  `$(…)` blocks until it dies even though spinel exited and no timeout fired. Killing only
  the direct child is not enough — `perl -e 'alarm N; exec …'` kills spinel and orphans the
  binary, still holding the pipe. (`samples/text/huffman.rb` was the standing Ruby-instant /
  Spinel-never-terminating example; it terminates on current master, so don't assume it
  still hangs — the lesson stands without a live example.)
- **Every child needs a hard timeout**, reported as `TIMEOUT` (a DIFF), never a pass — and it
  must cover the **compile** step, not just the run: a hang inside `spinel`, before any binary
  exists, is indistinguishable from a runaway binary.

After an interrupted sweep, clear orphans before trusting timings: `pgrep -fl spinel_run_`,
then `pkill -9 -f spinel_run_`.

Then triage the diffs: most map to an existing report (skip) or to RNG / a known unsupported
feature (ignore). Anything left is a new finding → file a bug.

## `tests/` vs `samples/` — what goes where

Two distinct directories, do not conflate them:

- **`tests/`** — the **method test suite**. `tests/<class>/<method>.rb`, one file per method,
  exercising that single method in isolation across its call forms. Individual-method test
  cases belong here.
- **`samples/`** — **small/medium programs that accomplish something**: a real tool,
  algorithm, parser, simulation or report with a purpose and meaningful output (e.g.
  `graph/dijkstra.rb`, `parsing/json_parser.rb`, `parsing/bytecode_vm.rb`). Samples exercise the library
  *incidentally*, through realistic end-to-end code, which is what surfaces the cross-method
  / cross-call-site inference bugs a single-method probe misses. Aim them at what
  **whole-program** inference has to resolve: recursive user types, polymorphic dispatch,
  closures carried through folds, nested containers, and return types that only settle once
  the whole call graph is known.

**Samples are filed by domain, one level deep**: `samples/<domain>/<name>.rb`. The domains
are `graph`, `dp`, `parsing`, `text`, `numeric`, `structures`, `oop`, `functional`,
`control_flow`, `concurrency`, `domain` (business/reporting programs). Pick the one naming
what the program *does*; when two fit, prefer the one you would look in first. `regression`
globs `<dir>/**/*.rb`, so a new domain dir needs no tooling change — but adding one should
be rare, and never for a single file.

**A sample's filename must state its purpose and how it differs from its neighbours.**
`tokenizer.rb`, `tokenizer2.rb`, `tokenizer3.rb` told you nothing about which was which;
`tokenizer_scan_alternation.rb`, `tokenizer_char_loop.rb` and `tokenizer_scan_captures.rb`
name the mechanism each one exercises. Never disambiguate with a trailing digit — if a
second sample covers the same ground by a different route, say which route in the name. If
two files really do the same thing the same way, fold them into one rather than renaming
both.

**A sample must NOT be a grab-bag of isolated method probes** (a flat sequence of
`p(receiver.method(args))` with throwaway numbered locals and no overarching purpose). That
is a test file in the wrong place — its coverage belongs in `tests/<class>/<method>.rb`.
Reserve one-line method checks for `tests/` and minimal snippets for `bugs/<ID>.rb`.

**Samples must be deterministic**, and self-contained in one file that runs standalone under
`ruby`. No RNG, wall-clock or address-dependent output (`#<Foo:0x…>`, unseeded
`sample`/`shuffle`/`rand`, `Time.now`) — output that varies between runs can't be diffed, so
it reports a divergence on every sweep instead of when Spinel breaks. Seed randomness or
enumerate exhaustively. A threaded sample must print only after the joins that fix ordering;
confirm by running its compiled binary a few times for byte-identical output.

## The test suite

`tests/<class>/<method>.rb` — **one file per method**, one dir per class (`tests/array/join.rb`).
Each file exercises its method in up to four call forms: literal receiver; receiver in a
variable (mutating methods mutate then print it); receiver + argument in variables; result
captured in a variable. Number locals uniquely (`a001`/`b001`, `a002`, …) — Spinel gives each
local one type for the whole program, so reusing a name for two types breaks compilation.

**Filenames.** Operator names are **literal** — every operator char is a legal filename
(`+.rb`, `**.rb`, `<<.rb`, `<=>.rb`, `[].rb`, `[]=.rb`, `==.rb`, `!.rb`, `%.rb`, …),
including trailing `?`/`!` (`even?.rb`, `map!.rb`). The **only** substitution is `/` →
`divide`. Some word names are the real method, not a substitution: `modulo.rb` = `#modulo`
(the operator is `%.rb`); `pow.rb` = `#pow` (the operator is `**.rb`). Colliding methods (a
`#foo`/`.foo` pair, or a real method vs `/`→`divide`) share one file, each keeping its header.

**Header.** Each file opens with a comment naming class + method (`# Array#join`,
`# Hash.new`, `# TrueClass#&`). Merged files keep one header per form; a fixture-first file's
header follows the shared setup.

**Fixtures.** Each file must run standalone under `ruby`, so shared setup (`require`s, helper
`class`/`module` defs, `Struct.new` constants, shared instances) is duplicated atop every
file in the class dir that needs it.

**Growing it.** Add cases for classes/methods/forms not yet covered. If a case matches, keep
it; if it differs, file a bug.

Rules:

- Every line is **faithful Ruby** — never rewrite a test to make Spinel pass.
- **Every test exercises both a direct call and an assignment**: alongside `p(EXPR)`, capture
  and print it (`vNNN = EXPR; p vNNN`). (A rescue-wrapped error probe is already the
  assignment form; its direct form would abort, so it stays single.)
- **One method per file — never group methods.** A bug spanning several methods gets a tagged
  line in *each* method's file.
- **Comment out a line only if it makes the file fail to compile.** Leave runtime value
  differences and runtime errors live — they are the diffs you report.
- **Every filed bug has ≥1 test case**; every commented-out or diff-producing line is tagged
  `# BUG <ID> - [cause]`.
- **Documented limitations are not bugs** (see below): no `# BUG` tag — comment out and tag
  `# WONTFIX` citing the limitation, so they never resurface in triage. **Canonical format** —
  `"[section] — [sub-section]"`, where *section* is the short `##` header with any
  parenthetical dropped (`## By design (deliberate choices)` → `By design`) and *sub-section*
  is the `limitations.md` subsection header text without its `####`, joined by an em-dash:

      # WONTFIX: See docs/limitations.md - "By design — String#unicode_normalize"

  For a genuine-but-*undocumented* limitation (a doc-gap report is on file), cite the report
  until the doc entry lands, then switch to the doc form:

      # WONTFIX: See bugs/<ID> (short reason; pending docs/limitations.md entry)
- **A C compile abort is ALWAYS a bug — file it, never WONTFIX.** True even when Ruby
  *raises* on the same operation, and even for a feature absent from the limitations doc:
  Spinel must never emit ill-typed C; it should build and raise the matching error at runtime
  (rescuable), like CRuby. A failed C build takes down the whole program — a `rescue` can't
  catch a compile error — so valid Ruby that only touches the op behind a `rescue` runs and
  prints under Ruby but won't build under Spinel. Distinguish:
  - **C compile abort** — Spinel emits C, the C compiler rejects it, ending in `spinel: C
    compilation failed`. → file it (`# BUG <ID>`, kept commented since it aborts the file). A
    rescue-wrapped probe (`r = (EXPR rescue $!.class); p r`) is the sharpest repro: Ruby
    prints the error class, Spinel fails to build.
  - **Clean front-end reject** — Spinel refuses *before* emitting C (`spinel: … unsupported
    …`). For a documented, deliberate reject (`Hash#compare_by_identity`, `require`) that is
    by design → `# WONTFIX` + citation. An *undocumented* clean reject is a judgment call —
    lean toward filing.
- **Never rewrite a report to track changed behaviour.** On a partial fix, delete the old
  report and file a new one. IDs are never reused, and the new report does **not** cite the
  old one — see the standalone rule under *Filing a bug*.

## Known unsupported features (don't report)

Spinel's deliberate divergences are catalogued in its own limitations doc — **read it, don't
duplicate it here**:

- Local: `~/spinel/docs/limitations.md`
- Remote: <https://github.com/matz/spinel/blob/master/docs/limitations.md>

Anything described there — AOT limits, deliberate design choices, and intentional CRuby
incompatibilities (`eval`/metaprogramming, no encoding, no exception backtrace, `Integer **
negative`, integer overflow without Bignum promotion, `Complex` components stored as `Float`,
`Complex ** Float` ULP diffs, no ivar reflection, `Object#methods`,
`Hash#compare_by_identity`, `Range#%` / blockless `Range#step` as Array, unenforced method
privacy, …) — **is not a bug**. Comment out its test lines and tag `# WONTFIX: [reason]`.

**Threads are supported, not a limitation.** Spinel implements a real M:N thread runtime (no
GVL) with `Thread`/`Mutex`/`Queue`/`SizedQueue`/`ConditionVariable` — see
`~/spinel/docs/thread.md` for the **Supported-API whitelist**. Do NOT WONTFIX threading as
"unsupported". A method *absent from that whitelist* that cleanly front-end-rejects is
documented-by-omission → `# WONTFIX: not in docs/thread.md Supported API`; but a whitelisted
method that emits ill-typed C, hangs, or returns the wrong value IS a bug.

## Filing a bug

Read existing `bugs/*.md` first — don't duplicate; note a related symptom on the existing
report instead.

**A report's ID is a creation timestamp, not a sequence number**, so parallel agents never
collide. Mint once at millisecond precision (second resolution is NOT enough when fanning
out):

    ID=$(ruby -e 'puts Time.now.strftime("%Y%m%d%H%M%S%L")')   # e.g. 20260713194810764

The same `<ID>` goes two places: the two filenames, and the `# BUG <ID> - [cause]` test tag.
It's all digits, so the `# BUG [0-9]+` sweep still works, and it sorts chronologically.
**The ID does NOT go in the title** — the filename is its only home in the report itself, so
a report is identified by its stem (`bugs/<ID>_slug.md`) and located with `ls bugs/<ID>_*`.
Older reports keep legacy short sequential `N_slug` names — leave those filenames alone.

Each bug is two files sharing the `<ID>_slug` stem: `<ID>_slug.md` (write-up) +
`<ID>_slug.rb` (smallest standalone repro; secondary variants in comments), plus ≥1 tagged
`tests/` line.

The `.md`, in order:

1. Title — `# [Compiler] …` (breaks compilation) or `# [Runtime] …` (compiles, wrong
   behaviour). No ID, no number: the title starts at the `[Kind]` tag.
2. The note, verbatim, as a blockquote:
   > (Disclaimer: I asked Claude Opus 5 (high) to find Spinel compile/runtime issues with documented Ruby classes and methods. It found the following issue, which I manually verified for accuracy before publishing this report)
3. Version line: ``_Reproduced with `spinel <REV>` vs `ruby <VER>`._`` (`<REV>` from
   `spinel --version`, `<VER>` from `ruby --version`).
4. A 2–3 line description of observed behaviour only — no internals, no severity, unwrapped.
5. `## Repro` — the script, then its Ruby vs Spinel output. No "Expected".
6. `## Compile error` — verbatim Spinel output, only when compilation fails.

Re-verify every repro against the current build before filing.

**Every report is completely standalone.** A report never references another bug report, a
`samples/` script or a `tests/` file — not by filename, not by title, not as "the older
report" or "the sample this came from". A reader with only the one `.md` in front of them must
be able to understand and reproduce the bug, so:

- **Inline the repro in the `.md`.** Never point at the paired `.rb` (or any other file) in
  place of the script. Copying the `## Repro` block out of the write-up and running it must
  reproduce the divergence on its own — verify that, don't assume it.
- **No "Follows on from".** When a report supersedes a partially-fixed one, describe the
  behaviour that remains and stop there. Do not name, quote or summarise the old report; the
  fact that some earlier form got fixed is not part of the new report.
- **Keep filenames out of `## Compile error` too.** The block stays verbatim, but capture it
  from a neutrally-named scratch copy (`r1.rb`) so the diagnostic doesn't name a corpus file.
- **Restate, don't cite.** A useful observation that happens to live in a sample or test —
  "in a larger program this surfaces as a runtime error instead" — is kept by describing the
  shape, with the file left unnamed.

The trade-off is deliberate: a standalone report loses the history of what was fixed around
it. That history is not worth a reference, because reports are deleted on a fix and IDs are
never reused, so any citation eventually points at nothing.

**No README or status index anywhere in this repo.** A checked-in "N match, M diverge" table
outlives the reports it cites (IDs are deleted on a fix, never reused) and then misleads —
`samples/README.md` was removed for exactly that. The live answers come from the tools:
`triage` for report status, `regression [DIR]` for which files diverge, and each file's
`# BUG <ID>` / `# WONTFIX` tag for why.
