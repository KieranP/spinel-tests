# frozen_string_literal: true
# NilClass#&
p(nil & true)
p(nil & false)
p(nil & nil)
p(nil & 0)
n002 = nil; p(n002 & true)
v003 = (n002 & true); p v003
n003 = nil; p(n003 & false)
n004 = nil; v004 = (n004 & nil); p v004
n005 = nil; p(n005 & 0)
n006 = nil; p(n006 & "x")
# receiver and argument both in variables
n007 = nil; a007 = true; p(n007 & a007)
n008 = nil; a008 = true; v008 = (n008 & a008); p v008
# more argument types (nil & anything is always false)
p(nil & 1.5)
p(nil & :sym)
p(nil & [])
n009 = nil; p(n009 & Object.new)
# result is always false, usable in a condition
r010 = (nil & true)
p(r010 == false)
