# frozen_string_literal: true
# Math.atan

p(Math.atan(0))
a001 = Math.atan(0)
p a001

p(Math.atan(1))
a002 = Math.atan(1)
p a002.class
p a002

p(Math.atan(-1))
p(Math.atan(100))

b003 = 2
p(Math.atan(b003))
c003 = Math.atan(b003)
p c003

# special values
p(Math.atan(Float::INFINITY))
p(Math.atan(-Float::INFINITY))
p(Math.atan(Float::NAN))

# signed zero is preserved (atan(0.0) => 0.0, atan(-0.0) => -0.0)
p(Math.atan(0.0))
p(Math.atan(-0.0))
d010 = -0.0
p(Math.atan(d010))

# coercion
p(Math.atan(Rational(1)))
