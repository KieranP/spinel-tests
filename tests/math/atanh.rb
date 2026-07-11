# frozen_string_literal: true
# Math.atanh

p(Math.atanh(0))
a001 = Math.atanh(0)
p a001

p(Math.atanh(0.5))
a002 = Math.atanh(0.5)
p a002.class
p a002

p(Math.atanh(-0.5))
p(Math.atanh(1))
p(Math.atanh(-1))

b003 = 0.25
p(Math.atanh(b003))
c003 = Math.atanh(b003)
p c003

# outside (-1, 1)
begin; Math.atanh(2); rescue => e004; p e004.class; end
d005 = -2
begin; Math.atanh(d005); rescue => e005; p e005.class; end

# special value
p(Math.atanh(Float::NAN))

# coercion
p(Math.atanh(Rational(1, 2)))

# exact boundary as a Float -> Infinity
p(Math.atanh(1.0))
