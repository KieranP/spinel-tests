# frozen_string_literal: true
# Math.log10

p(Math.log10(1))
a001 = Math.log10(1)
p a001

p(Math.log10(1000))
a002 = Math.log10(1000)
p a002.class
p a002

p(Math.log10(100))
p(Math.log10(0.5))

b003 = 10000
p(Math.log10(b003))
c003 = Math.log10(b003)
p c003

# log10(0) is -Infinity (both), while a negative argument is a domain error
p(Math.log10(0))
p(Math.log10(0.0))
begin; Math.log10(-1); rescue => e004; p e004.class; end
r005 = (Math.log10(-2.0) rescue $!.class); p r005
r006 = (Math.log10(-1) rescue $!.class); p r006

# exact powers of ten
p(Math.log10(10))
p(Math.log10(100000))
p(Math.log10(10**12))

# special values
p(Math.log10(Float::INFINITY))
p(Math.log10(Float::NAN))

# coercion
p(Math.log10(Rational(1)))

# Bignum argument is truncated to a machine int
p(Math.log10(10**30))
