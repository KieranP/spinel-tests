# frozen_string_literal: true
# Math.tanh

p(Math.tanh(0))
a001 = Math.tanh(0)
p a001

p(Math.tanh(1))
a002 = Math.tanh(1)
p a002.class
p a002

p(Math.tanh(-1))
p(Math.tanh(2))

b003 = 3
p(Math.tanh(b003))
c003 = Math.tanh(b003)
p c003

# special values (saturates to +/-1.0 at the infinities)
p(Math.tanh(Float::INFINITY))
p(Math.tanh(-Float::INFINITY))
p(Math.tanh(Float::NAN))

# signed zero is preserved
p(Math.tanh(0.0))
p(Math.tanh(-0.0))
d010 = -0.0
p(Math.tanh(d010))

# coercion
p(Math.tanh(Rational(1)))
e011 = Rational(1)
p(Math.tanh(e011))
