# frozen_string_literal: true
# Math.log2

p(Math.log2(1))
a001 = Math.log2(1)
p a001

p(Math.log2(8))
a002 = Math.log2(8)
p a002.class
p a002

p(Math.log2(1024))
p(Math.log2(0.5))

b003 = 64
p(Math.log2(b003))
c003 = Math.log2(b003)
p c003

# log2(0) is -Infinity (both), while a negative argument is a domain error
p(Math.log2(0))
p(Math.log2(0.0))
begin; Math.log2(-1); rescue => e004; p e004.class; end
r005 = (Math.log2(-2.0) rescue $!.class); p r005
r006 = (Math.log2(-1) rescue $!.class); p r006

# exact powers of two
p(Math.log2(2))
p(Math.log2(65536))
p(Math.log2(2**20))

# special values
p(Math.log2(Float::INFINITY))
p(Math.log2(Float::NAN))

# coercion
p(Math.log2(Rational(1)))

# Bignum argument is truncated to a machine int
p(Math.log2(2**100))
