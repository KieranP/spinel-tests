# frozen_string_literal: true
# Math.asin

p(Math.asin(0))
a001 = Math.asin(0)
p a001

p(Math.asin(1))
a002 = Math.asin(1)
p a002.class
p a002

p(Math.asin(-1))
p(Math.asin(0.5))

b003 = 1
p(Math.asin(b003))
c003 = Math.asin(b003)
p c003

# out of domain
begin; Math.asin(2); rescue => e004; p e004.class; end
d005 = 2
begin; Math.asin(d005); rescue => e005; p e005.class; end

# special value
p(Math.asin(Float::NAN))

# coercion
p(Math.asin(Rational(1, 2)))

# just past the domain boundary, and the exact -1 boundary
begin; Math.asin(1.0000000001); rescue => e020; p e020.class; end
p(Math.asin(-1.0))
