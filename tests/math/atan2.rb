# frozen_string_literal: true
# Math.atan2

p(Math.atan2(1, 1))
a001 = Math.atan2(1, 1)
p a001

p(Math.atan2(1, -1))
a002 = Math.atan2(1, -1)
p a002.class
p a002

p(Math.atan2(-1, 1))
p(Math.atan2(-1, -1))
p(Math.atan2(0, 0))
p(Math.atan2(1.0, 0.0))

# both arguments in variables
b003 = 3
c003 = 4
p(Math.atan2(b003, c003))
d003 = Math.atan2(b003, c003)
p d003

# special values
p(Math.atan2(Float::INFINITY, Float::INFINITY))
p(Math.atan2(1.0, Float::INFINITY))
p(Math.atan2(Float::NAN, 1.0))

# Rational coercion (both args)
p(Math.atan2(Rational(1), Rational(1)))
g010 = Rational(1, 2)
h010 = Rational(1, 2)
p(Math.atan2(g010, h010))

# signed-zero quadrant handling (all match)
p(Math.atan2(0.0, -0.0))
p(Math.atan2(-0.0, -0.0))
p(Math.atan2(0.0, -1.0))
p(Math.atan2(-0.0, -1.0))
p(Math.atan2(-0.0, 1.0))

# Bignum argument (either position) is truncated to a machine int
p(Math.atan2(2**100, 1))
p(Math.atan2(1, 2**100))
