# frozen_string_literal: true
# Math.cosh

p(Math.cosh(0))
a001 = Math.cosh(0)
p a001

p(Math.cosh(1))
a002 = Math.cosh(1)
p a002.class
p a002

p(Math.cosh(-1))
p(Math.cosh(2))

b003 = 3
p(Math.cosh(b003))
c003 = Math.cosh(b003)
p c003

# special values (cosh is even: +Infinity at both infinities)
p(Math.cosh(Float::INFINITY))
p(Math.cosh(-Float::INFINITY))
p(Math.cosh(Float::NAN))

# cosh(0) == 1.0 exactly, and cosh is even so -0.0 gives 1.0 too
p(Math.cosh(0.0))
p(Math.cosh(-0.0))

# coercion
p(Math.cosh(Rational(1)))
d010 = Rational(1)
p(Math.cosh(d010))

# overflow to Infinity (even function: -1000 overflows too)
p(Math.cosh(1000))
p(Math.cosh(-1000))
