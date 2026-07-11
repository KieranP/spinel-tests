# frozen_string_literal: true
# NilClass#to_r
p(nil.to_r)
v021 = (nil.to_r); p v021
n015 = nil; p(n015.to_r)
n015 = nil; v022 = (n015.to_r); p v022
# nil.to_r is (0/1)
p(nil.to_r == (0/1r))
p(nil.to_r.class)
p(nil.to_r.numerator)
p(nil.to_r.denominator)
# usable in arithmetic
p(nil.to_r + Rational(1, 2))
n023 = nil; s023 = n023.to_r + 1; p s023
