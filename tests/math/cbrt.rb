# frozen_string_literal: true
# Math.cbrt

p(Math.cbrt(27))
a001 = Math.cbrt(27)
p a001

p(Math.cbrt(-27))
a002 = Math.cbrt(-27)
p a002.class
p a002

p(Math.cbrt(0))
p(Math.cbrt(8))
p(Math.cbrt(8.0))

b003 = 64
p(Math.cbrt(b003))
c003 = Math.cbrt(b003)
p c003

# special values
p(Math.cbrt(Float::INFINITY))
p(Math.cbrt(-Float::INFINITY))
p(Math.cbrt(Float::NAN))

# coercion
p(Math.cbrt(Rational(27, 8)))
g010 = Rational(-8)
p(Math.cbrt(g010))

# signed zero is preserved (cbrt is odd)
p(Math.cbrt(0.0))
p(Math.cbrt(-0.0))
n010 = -0.0
p(Math.cbrt(n010))

# exact unit roots
p(Math.cbrt(1))
p(Math.cbrt(-1))
p(Math.cbrt(1000000))

# NaN passes through
p(Math.cbrt(Float::NAN))

# Bignum argument is truncated to a machine int
p(Math.cbrt(2**99))
