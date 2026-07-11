# frozen_string_literal: true
# Math.sqrt

p(Math.sqrt(4))
a001 = Math.sqrt(4)
p a001

p(Math.sqrt(2))
a002 = Math.sqrt(2)
p a002.class
p a002

p(Math.sqrt(0))
p(Math.sqrt(16))
p(Math.sqrt(4.0))
p(Math.sqrt(2**10))

# argument in a variable
b003 = 9
p(Math.sqrt(b003))
c003 = Math.sqrt(b003)
p c003

# negative zero
p(Math.sqrt(-0.0))
d004 = -0.0
p(Math.sqrt(d004))

# domain error on negative
begin; Math.sqrt(-1); rescue => e005; p e005.class; end
begin; Math.sqrt(-4); rescue Math::DomainError => e006; p e006.class; end

# raising Math::DomainError directly resolves to a bare DomainError
begin
  raise Math::DomainError, "boom"
rescue Math::DomainError => e007
  puts "caught: #{e007.class}"
rescue StandardError => e008
  puts "missed: #{e008.class}"
end

# special values
p(Math.sqrt(Float::INFINITY))
p(Math.sqrt(Float::NAN))
g010 = Float::INFINITY
p(Math.sqrt(g010))

# Rational / in-range Integer coercion
p(Math.sqrt(Rational(9, 4)))
p(Math.sqrt(2**62))
h011 = Rational(25, 4)
k011 = Math.sqrt(h011)
p k011

# Bignum argument is truncated to a machine int
p(Math.sqrt(2**100))
p(Math.sqrt(10**20))
m012 = 2**100
p(Math.sqrt(m012))

# negative Float is also out of domain
begin; Math.sqrt(-1.0); rescue => e020; p e020.class; end

# Math does NOT coerce an arbitrary object via #to_f -> TypeError (both)
class SqrtToF; def to_f; 2.0; end; end
begin; Math.sqrt(SqrtToF.new); rescue => e030; p e030.class; end
