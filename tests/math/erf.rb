# frozen_string_literal: true
# Math.erf

p(Math.erf(0))
a001 = Math.erf(0)
p a001

p(Math.erf(1))
a002 = Math.erf(1)
p a002.class
p a002

p(Math.erf(-1))
p(Math.erf(2))

b003 = 0.5
p(Math.erf(b003))
c003 = Math.erf(b003)
p c003

# special values (saturates to +/-1.0 at the infinities)
p(Math.erf(Float::INFINITY))
p(Math.erf(-Float::INFINITY))
p(Math.erf(Float::NAN))

# erf is odd: erf(0.0) == 0.0, erf(-0.0) == -0.0 (signed zero preserved)
p(Math.erf(0.0))
p(Math.erf(-0.0))
d010 = -0.0
p(Math.erf(d010))

# coercion
p(Math.erf(Rational(1, 2)))
e011 = Rational(1, 2)
p(Math.erf(e011).round(12))
