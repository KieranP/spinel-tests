# frozen_string_literal: true
# Math.hypot

p(Math.hypot(3, 4))
a001 = Math.hypot(3, 4)
p a001

p(Math.hypot(5, 12))
a002 = Math.hypot(5, 12)
p a002.class
p a002

p(Math.hypot(0, 0))
p(Math.hypot(-3, -4))
p(Math.hypot(3.0, 4.0))

b003 = 8
c003 = 15
p(Math.hypot(b003, c003))
d003 = Math.hypot(b003, c003)
p d003

# special values
p(Math.hypot(Float::INFINITY, 1.0))
p(Math.hypot(Float::NAN, 1.0))

# an infinite leg wins even against NaN (C hypot special-cases this to Infinity)
p(Math.hypot(Float::INFINITY, Float::NAN))
p(Math.hypot(Float::NAN, Float::INFINITY))
p(Math.hypot(-Float::INFINITY, 100.0))

# a zero leg reduces to |other|; sign of args does not matter
p(Math.hypot(0, 5))
p(Math.hypot(5, 0))
p(Math.hypot(-3, 4))

# more exact Pythagorean triples
p(Math.hypot(7, 24))
p(Math.hypot(20, 21))
e015 = 9
f015 = 40
p(Math.hypot(e015, f015))

# Rational coercion (both args)
p(Math.hypot(Rational(3), Rational(4)))

# Bignum argument is truncated to a machine int
p(Math.hypot(2**70, 2**70))

# Bignum in the second argument is truncated too
p(Math.hypot(1, 2**100))
