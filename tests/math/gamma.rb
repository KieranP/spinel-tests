# frozen_string_literal: true
# Math.gamma

p(Math.gamma(1))
a001 = Math.gamma(1)
p a001

p(Math.gamma(5))
a002 = Math.gamma(5)
p a002.class
p a002

p(Math.gamma(6))
p(Math.gamma(0.5))
p(Math.gamma(-0.5))
p(Math.gamma(0))
p(Math.gamma(200))

b003 = 7
p(Math.gamma(b003))
c003 = Math.gamma(b003)
p c003

# negative integer is out of domain
begin; Math.gamma(-1); rescue => e004; p e004.class; end

# special values
p(Math.gamma(Float::INFINITY))
p(Math.gamma(Float::NAN))
begin; Math.gamma(-Float::INFINITY); rescue => e010; p e010.class; end

# coercion
p(Math.gamma(Rational(6, 1)))

# negative integers are out of domain
begin; Math.gamma(-2); rescue => e020; p e020.class; end
begin; Math.gamma(-3); rescue => e021; p e021.class; end
