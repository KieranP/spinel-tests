# frozen_string_literal: true
# Math.sinh

p(Math.sinh(0))
a001 = Math.sinh(0)
p a001

p(Math.sinh(1))
a002 = Math.sinh(1)
p a002.class
p a002

p(Math.sinh(-1))
p(Math.sinh(2))

b003 = 3
p(Math.sinh(b003))
c003 = Math.sinh(b003)
p c003

# special values
p(Math.sinh(Float::INFINITY))
p(Math.sinh(-Float::INFINITY))
p(Math.sinh(Float::NAN))

# coercion
p(Math.sinh(Rational(1)))

# signed zero is preserved
p(Math.sinh(0.0))
p(Math.sinh(-0.0))
d010 = -0.0
p(Math.sinh(d010))

# overflow to Infinity (and negative overflow to -Infinity)
p(Math.sinh(1000))
p(Math.sinh(-1000))
