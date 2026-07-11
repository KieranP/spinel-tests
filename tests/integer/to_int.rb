# frozen_string_literal: true
# Integer#to_int
p(42.to_int)
a333 = 42; p(a333.to_int)
a334 = 42; c334 = (a334.to_int); p c334

p(0.to_int)
p((-42).to_int)
a335 = -42; p(a335.to_int)
a336 = 0; c336 = (a336.to_int); p c336

# Bignum receiver: to_int returns self.
p((10 ** 30).to_int)
x337 = 10 ** 30; p(x337.to_int)
x338 = 10 ** 30; c338 = (x338.to_int); p c338
