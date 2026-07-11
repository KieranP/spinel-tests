# frozen_string_literal: true
# KeyError#== (Exception#==)
# equal: same class and same message
p(KeyError.new("bad") == KeyError.new("bad"))
a001 = KeyError.new("bad"); b001 = KeyError.new("bad"); p(a001 == b001)
c001 = (KeyError.new("bad") == KeyError.new("bad")); p c001

# different message -> not equal
p(KeyError.new("a") == KeyError.new("b"))
a002 = KeyError.new("a"); b002 = KeyError.new("b"); p(a002 == b002)

# different class, same message -> not equal
p(KeyError.new("x") == IndexError.new("x"))
a003 = KeyError.new("x"); b003 = IndexError.new("x"); p(a003 == b003)

# reflexive
a004 = KeyError.new("m"); p(a004 == a004)
c004 = (a004 == a004); p c004

# not equal to a non-exception
p(KeyError.new("m") == "m")
c005 = (KeyError.new("m") == "m"); p c005
