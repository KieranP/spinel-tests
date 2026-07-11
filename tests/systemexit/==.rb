# frozen_string_literal: true
# SystemExit#== (Exception#==)
# equal: same class and same message
p(SystemExit.new(3, "m") == SystemExit.new(3, "m"))
a001 = SystemExit.new(3, "m"); b001 = SystemExit.new(3, "m"); p(a001 == b001)
c001 = (SystemExit.new(3, "m") == SystemExit.new(3, "m")); p c001

# same class, default message, differing status is still == (== compares message, not status)
p(SystemExit.new(2) == SystemExit.new(9))
c002 = (SystemExit.new(2) == SystemExit.new(9)); p c002

# different message -> not equal
p(SystemExit.new(3, "a") == SystemExit.new(3, "b"))
a003 = SystemExit.new(3, "a"); b003 = SystemExit.new(3, "b"); p(a003 == b003)

# different class, same message -> not equal
p(SystemExit.new("x") == RuntimeError.new("x"))
a004 = SystemExit.new("x"); b004 = RuntimeError.new("x"); p(a004 == b004)

# reflexive
a005 = SystemExit.new(2); p(a005 == a005)
c005 = (a005 == a005); p c005

# not equal to a non-exception
p(SystemExit.new("m") == "m")
c006 = (SystemExit.new("m") == "m"); p c006
