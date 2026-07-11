# frozen_string_literal: true
# Integer#clone
p(5.clone)
a001 = 5; p(a001.clone)
a002 = 5; c002 = (a002.clone); p c002
p((-5).clone)
p(5.clone.class)

# an Integer is always frozen, so the clone is frozen too
p(5.clone.frozen?)

# clone(freeze: true) is accepted and returns the (frozen) value
p(5.clone(freeze: true))
a003 = 5; c003 = (a003.clone(freeze: true)); p c003

# WONTFIX: See docs/limitations.md - "By design — Unboxed value types: identity IS the value"
# p(5.clone(freeze: false))
