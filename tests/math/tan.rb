# frozen_string_literal: true
# Math.tan

p(Math.tan(0))
a001 = Math.tan(0)
p a001

p(Math.tan(1))
a002 = Math.tan(1)
p a002.class
p a002

p(Math.tan(-1))
p(Math.tan(0.5))

b003 = 2
p(Math.tan(b003))
c003 = Math.tan(b003)
p c003

# special values
p(Math.tan(Float::NAN))

# tan of Infinity is NaN in both (not a domain error, unlike sin/cos)
p(Math.tan(Float::INFINITY))

# non-real Complex argument: wrong error class
begin; Math.tan(Complex(1, 2)); rescue => e004; p e004.class; end

# signed zero is preserved
p(Math.tan(0.0))
p(Math.tan(-0.0))

# exact-ish quarter-turn, rounded to absorb a trailing ULP
p(Math.tan(Math::PI / 4).round(12))
d010 = Math::PI / 4
p(Math.tan(d010).round(12))

# coercion
p(Math.tan(Rational(0)))
