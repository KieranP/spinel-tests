# frozen_string_literal: true
# String.new
p(String.new)
p(String.new("hi"))
a001 = String.new("hi"); p a001
a002 = "hi"; b002 = String.new(a002); p b002
a003 = String.new("hi"); b003 = (a003.length); p b003
# the result is a fresh, mutable object
p(String.new("hi").frozen?)
a004 = String.new("hi"); a004 << "!"; p a004
# a String.new copy is not the same object as its source
a005 = "hi"; p(String.new(a005).equal?(a005))
p(String.new("hi") == "hi")
# the empty default
p(String.new.empty?)
a006 = String.new; a006 << "x"; p a006
