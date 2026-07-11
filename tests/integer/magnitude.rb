# frozen_string_literal: true
# Integer#magnitude
p(-7.magnitude)
a339 = -7; p(a339.magnitude)
a340 = -7; c340 = (a340.magnitude); p c340

p(0.magnitude)
p(7.magnitude)
p((-7).magnitude)
a341 = 0; p(a341.magnitude)
a342 = 9; c342 = (a342.magnitude); p c342

# Bignum receiver:
p((2 ** 100).magnitude)
x343 = 2 ** 100; p(x343.magnitude)
x344 = 2 ** 100; c344 = (x344.magnitude); p c344

# Negative Bignum:
p((1 - 2 ** 100).magnitude)
x345 = 1 - 2 ** 100; p(x345.magnitude)
x346 = 1 - 2 ** 100; c346 = (x346.magnitude); p c346
