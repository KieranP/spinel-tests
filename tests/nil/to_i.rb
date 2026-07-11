# frozen_string_literal: true
# NilClass#to_i
p(nil.to_i)
v019 = (nil.to_i); p v019
n014 = nil; p(n014.to_i)
v020 = (n014.to_i); p v020
# nil.to_i is 0
p(nil.to_i == 0)
p(nil.to_i.class)
# usable in arithmetic
p(nil.to_i + 5)
n021 = nil; s021 = n021.to_i + 10; p s021
# a nil-or-int value coerced with to_i
def maybe022(b); b ? 42 : nil; end
r022 = maybe022(false).to_i; p r022
r023 = maybe022(true).to_i; p r023
