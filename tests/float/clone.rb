# frozen_string_literal: true
# Float#clone (immutable value — the copy is the same frozen Float)
p(3.5.clone)
a001 = 3.5; p(a001.clone)
a002 = 3.5; c002 = (a002.clone); p c002

# a Float is always frozen; clone keeps it frozen, equal? holds for immediates
p(3.5.clone.frozen?)
p(3.5.clone.equal?(3.5))
a003 = -2.5; c003 = (a003.clone); p c003

# clone(freeze: true) / (freeze: nil) keep the frozen copy (both match Ruby)
p(3.5.clone(freeze: true))
p(3.5.clone(freeze: nil))

# clone(freeze: false) must raise ArgumentError ("can't unfreeze Float") — Spinel
# silently returns the value instead.
r004 = (3.5.clone(freeze: false) rescue $!.class); p r004
a004 = 3.5; r005 = (a004.clone(freeze: false) rescue $!.class); p r005
