# frozen_string_literal: true
# NilClass#to_f
p(nil.to_f)
v015 = (nil.to_f); p v015
n012 = nil; p(n012.to_f)
v016 = (n012.to_f); p v016
# nil.to_f is 0.0
p(nil.to_f == 0.0)
p(nil.to_f.class)
# usable in arithmetic
p(nil.to_f + 1.5)
n017 = nil; s017 = n017.to_f + 2.5; p s017
# a nil-or-float value coerced with to_f
def maybe018(b); b ? 3.5 : nil; end
r018 = maybe018(false).to_f; p r018
r019 = maybe018(true).to_f; p r019
