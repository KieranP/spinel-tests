# frozen_string_literal: true
# NilClass#to_c
p(nil.to_c)
v014 = (nil.to_c); p v014
n011 = nil; p(n011.to_c)
n011 = nil; v015 = (n011.to_c); p v015
# nil.to_c is (0+0i)
p(nil.to_c == Complex(0, 0))
p(nil.to_c.class)
p(nil.to_c.real)
p(nil.to_c.imaginary)
# usable in arithmetic
p(nil.to_c + Complex(1, 2))
n016 = nil; s016 = n016.to_c + Complex(0, 1); p s016
