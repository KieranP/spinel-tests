# frozen_string_literal: true
# NoMethodError#==
# same class + same message + same name compare equal
p(NoMethodError.new("a", :n) == NoMethodError.new("a", :n))
v001 = (NoMethodError.new("a", :n) == NoMethodError.new("a", :n)); p v001
# differing message compares unequal
p(NoMethodError.new("a") == NoMethodError.new("b"))
v002 = (NoMethodError.new("a") == NoMethodError.new("b")); p v002
# an error is == to itself
e003 = NoMethodError.new("x", :y); p(e003 == e003)
v003 = (e003 == e003); p v003
