# frozen_string_literal: true
# Kernel#warn — writes to $stderr (no stdout in the diff, which only sees stdout)
warn "danger"
warn("a", "b")
v441 = warn("x"); p v441

# warn writes one line per argument; an Array argument is flattened like puts.
# Both of these go to STDERR, so the stdout diff does not see them.
warn "a", "b"
warn 1, 2
warn :sym
warn nil
warn ["x", "y"]
v442 = warn(["x", "y"]); p v442
# warn "up", uplevel: 0    # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
warn "dep", category: :deprecated

# Routing stderr to stdout makes warn's output visible to a stdout comparison.
# Keep this last — it changes where every later write goes.
$stderr.reopen($stdout)
warn "plain"
warn ["x", "y"]
v443 = warn(["x", "y"]); p v443
