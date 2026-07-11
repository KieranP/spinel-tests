# frozen_string_literal: true
# StopIteration#== (Exception#==)
# equal: same class and same message
p(StopIteration.new("bad") == StopIteration.new("bad"))
a001 = StopIteration.new("bad"); b001 = StopIteration.new("bad"); p(a001 == b001)
c001 = (StopIteration.new("bad") == StopIteration.new("bad")); p c001

# different message -> not equal
p(StopIteration.new("a") == StopIteration.new("b"))
a002 = StopIteration.new("a"); b002 = StopIteration.new("b"); p(a002 == b002)

# different class, same message -> not equal
p(StopIteration.new("x") == IndexError.new("x"))
a003 = StopIteration.new("x"); b003 = IndexError.new("x"); p(a003 == b003)

# reflexive
a004 = StopIteration.new("m"); p(a004 == a004)
c004 = (a004 == a004); p c004

# not equal to a non-exception
p(StopIteration.new("m") == "m")
c005 = (StopIteration.new("m") == "m"); p c005
