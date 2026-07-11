# frozen_string_literal: true
# Math.acosh

p(Math.acosh(1))
a001 = Math.acosh(1)
p a001

p(Math.acosh(2))
a002 = Math.acosh(2)
p a002.class
p a002

p(Math.acosh(10))

b003 = 5
p(Math.acosh(b003))
c003 = Math.acosh(b003)
p c003

# below domain (< 1)
begin; Math.acosh(0); rescue => e004; p e004.class; end
d005 = 0.5
begin; Math.acosh(d005); rescue => e005; p e005.class; end

# special values
p(Math.acosh(Float::INFINITY))
p(Math.acosh(Float::NAN))

# coercion
p(Math.acosh(Rational(5, 2)))

# just below the domain boundary
begin; Math.acosh(0.9999999); rescue => e020; p e020.class; end
