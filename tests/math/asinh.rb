# frozen_string_literal: true
# Math.asinh

p(Math.asinh(0))
a001 = Math.asinh(0)
p a001

p(Math.asinh(1))
a002 = Math.asinh(1)
p a002.class
p a002

p(Math.asinh(-1))
p(Math.asinh(2))

b003 = 3
p(Math.asinh(b003))
c003 = Math.asinh(b003)
p c003

# special values (asinh has full domain: +/-Infinity pass through)
p(Math.asinh(Float::INFINITY))
p(Math.asinh(-Float::INFINITY))
p(Math.asinh(Float::NAN))

# signed zero is preserved
p(Math.asinh(0.0))
p(Math.asinh(-0.0))
d010 = -0.0
p(Math.asinh(d010))

# coercion
p(Math.asinh(Rational(1)))
e011 = Rational(1)
p(Math.asinh(e011))
