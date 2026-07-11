# frozen_string_literal: true
# Math.sin

p(Math.sin(0))
a001 = Math.sin(0)
p a001

p(Math.sin(1))
a002 = Math.sin(1)
p a002.class
p a002

p(Math.sin(Math::PI))
p(Math.sin(-1))
p(Math.sin(0.5))

b003 = 2
p(Math.sin(b003))
c003 = Math.sin(b003)
p c003

# non-real Complex argument: wrong error class
begin; Math.sin(Complex(1, 2)); rescue => e004; p e004.class; end

# special values (sin of Infinity is out of domain in both)
p(Math.sin(Float::NAN))
begin; Math.sin(Float::INFINITY); rescue => e010; p e010.class; end

# coercion
p(Math.sin(Rational(0)))

# Bignum argument is truncated to a machine int
p(Math.sin(2**100))
