# frozen_string_literal: true
# FrozenError#==
# equal: same class and same message
p(FrozenError.new("bad") == FrozenError.new("bad"))
a001 = FrozenError.new("bad"); b001 = FrozenError.new("bad"); p(a001 == b001)
c001 = (FrozenError.new("bad") == FrozenError.new("bad")); p c001

# different message -> not equal
p(FrozenError.new("a") == FrozenError.new("b"))
a002 = FrozenError.new("a"); b002 = FrozenError.new("b"); p(a002 == b002)

# different class, same message -> not equal
p(FrozenError.new("x") == RuntimeError.new("x"))
a003 = FrozenError.new("x"); b003 = RuntimeError.new("x"); p(a003 == b003)

# reflexive
a004 = FrozenError.new("m"); p(a004 == a004)
c004 = (a004 == a004); p c004

# not equal to a non-exception
p(FrozenError.new("m") == "m")
c005 = (FrozenError.new("m") == "m"); p c005
