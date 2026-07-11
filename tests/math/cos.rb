# frozen_string_literal: true
# Math.cos

p(Math.cos(0))
a001 = Math.cos(0)
p a001

p(Math.cos(1))
a002 = Math.cos(1)
p a002.class
p a002

p(Math.cos(Math::PI))
p(Math.cos(-1))
p(Math.cos(0.5))

b003 = 2
p(Math.cos(b003))
c003 = Math.cos(b003)
p c003

begin; Math.cos(Complex(1, 2)); rescue => e004; p e004.class; end

# special values (cos of Infinity is out of domain in both)
p(Math.cos(Float::NAN))
begin; Math.cos(Float::INFINITY); rescue => e010; p e010.class; end

# coercion
p(Math.cos(Rational(0)))
