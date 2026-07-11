# frozen_string_literal: true
# Integer#next
p(5.next)
a337 = 5; p(a337.next)
a338 = 5; c338 = (a338.next); p c338

p(0.next)
p((-1).next)
p((-5).next)
a343 = 0; p(a343.next)
a344 = -1; c344 = (a344.next); p c344

# Boundary (2**64 - 1).next:
p((2 ** 64 - 1).next)
x345 = 2 ** 64 - 1; p(x345.next)
x346 = 2 ** 64 - 1; c346 = (x346.next); p c346

# Bignum receiver:
p((2 ** 100).next)
x347 = 2 ** 100; p(x347.next)
x348 = 2 ** 100; c348 = (x348.next); p c348
