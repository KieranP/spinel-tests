# frozen_string_literal: true
# NilClass#^
p(nil ^ true)
p(nil ^ false)
p(nil ^ nil)
p(nil ^ 0)
n006 = nil; p(n006 ^ true)
v007 = (n006 ^ true); p v007
n007 = nil; p(n007 ^ false)
n008 = nil; v008 = (n008 ^ nil); p v008
n009 = nil; p(n009 ^ 0)
n010 = nil; p(n010 ^ "x")
# receiver and argument both in variables (nil ^ x is truthiness of x)
n011 = nil; a011 = true; p(n011 ^ a011)
n012 = nil; a012 = false; v012 = (n012 ^ a012); p v012
# more argument types
p(nil ^ :sym)
p(nil ^ [])
n013 = nil; p(n013 ^ Object.new)
# result used in a condition
r014 = (nil ^ true)
p(r014 == true)
r015 = (nil ^ nil)
p(r015 == false)
