# frozen_string_literal: true
# Integer#integer?
# Always true for any Integer.
p(5.integer?)
a111b = 5; r111b = a111b.integer?; p r111b

p(0.integer?)
p((-5).integer?)
a111c = 0; p(a111c.integer?)
a111d = -5; r111d = (a111d.integer?); p r111d

# Bignum receiver (true):
p((2 ** 100).integer?)
x111e = 2 ** 100; p(x111e.integer?)
x111f = 2 ** 100; r111f = (x111f.integer?); p r111f
