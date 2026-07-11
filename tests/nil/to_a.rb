# frozen_string_literal: true
# NilClass#to_a
p(nil.to_a)
v012 = (nil.to_a); p v012
n010 = nil; p(n010.to_a)
n010 = nil; v013 = (n010.to_a); p v013
# nil.to_a is an empty array
p(nil.to_a == [])
p(nil.to_a.class)
p(nil.to_a.length)
p(nil.to_a.empty?)
# usable in concatenation / splat
p([1, 2] + nil.to_a)
p([*nil.to_a, 9])
# receiver in a variable, result mutated then printed
n014 = nil; arr014 = n014.to_a; arr014 << 5; p arr014
# a nil-or-array value normalized with to_a
def maybe015(b); b ? [1, 2] : nil; end
r015 = maybe015(false).to_a; p r015
