# frozen_string_literal: true
# NameError#==
# same class + same message compare equal
p(NameError.new("a", :n) == NameError.new("a", :n))
v001 = (NameError.new("a", :n) == NameError.new("a", :n)); p v001
# differing message compares unequal
p(NameError.new("a") == NameError.new("b"))
v002 = (NameError.new("a") == NameError.new("b")); p v002
# an error is == to itself
e003 = NameError.new("x", :y); p(e003 == e003)
v004 = (e003 == e003); p v004
