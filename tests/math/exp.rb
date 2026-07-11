# frozen_string_literal: true
# Math.exp

p(Math.exp(0))
a001 = Math.exp(0)
p a001

p(Math.exp(1))
a002 = Math.exp(1)
p a002.class
p a002

p(Math.exp(-1))
p(Math.exp(2.5))

b003 = 3
p(Math.exp(b003))
c003 = Math.exp(b003)
p c003

# special values
p(Math.exp(Float::INFINITY))
p(Math.exp(-Float::INFINITY))
p(Math.exp(Float::NAN))

# coercion
p(Math.exp(Rational(0)))

# Bignum argument is truncated to a machine int
p(Math.exp(2**100))

# overflow / underflow
p(Math.exp(710))
p(Math.exp(-800))

# just inside the overflow / underflow boundaries
p(Math.exp(709.0).finite?)
p(Math.exp(-745).zero? == false)
p(Math.exp(-746))
p(Math.exp(1e6))
n010 = 1e6
p(Math.exp(n010))
