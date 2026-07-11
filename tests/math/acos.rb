# frozen_string_literal: true
# Math.acos

p(Math.acos(1))
a001 = Math.acos(1)
p a001

p(Math.acos(0))
a002 = Math.acos(0)
p a002.class
p a002

p(Math.acos(-1))
p(Math.acos(0.5))

b003 = 1
p(Math.acos(b003))
c003 = Math.acos(b003)
p c003

begin; Math.acos(2); rescue => e004; p e004.class; end
d005 = -2
begin; Math.acos(d005); rescue => e005; p e005.class; end

# special value
p(Math.acos(Float::NAN))

# coercion
p(Math.acos(Rational(1, 2)))

# just past the domain boundary, and the exact -1 boundary
begin; Math.acos(-1.0000000001); rescue => e020; p e020.class; end
p(Math.acos(-1.0))
