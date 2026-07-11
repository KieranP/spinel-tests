# frozen_string_literal: true
# Float#<=>
p(1.5 <=> 2.5)
p(2.5 <=> 1.5)
p(1.5 <=> 1.5)
a001 = 1.5; b001 = 2.5; p(a001 <=> b001)
a002 = 2.5; b002 = 1.5; c002 = (a002 <=> b002); p c002
p(1.5 <=> 2)
p((1.5 <=> "x").inspect)
p(0.5 <=> Rational(1,2))
a005 = 0.4; b005 = Rational(1,2); c005 = (a005 <=> b005); p c005

# signed zero and infinities
p(0.0 <=> -0.0)
p(Float::INFINITY <=> 1.0)
p(Float::INFINITY <=> Float::INFINITY)
p((-Float::INFINITY) <=> Float::INFINITY)

p(Float::NAN <=> 1.0)
a003 = Float::NAN; b003 = 1.0; p(a003 <=> b003)
a004 = Float::NAN; b004 = 1.0; c004 = (a004 <=> b004); p c004
p(Float::NAN <=> Float::NAN)

# Float <=> Bignum: Ruby returns -1/0/1; Spinel emits ill-typed C (aborts the build).
# The other comparison operators handle a Bignum argument fine.
p(2.0 <=> 10**40)
a006 = 2.0; b006 = 10**40; c006 = (a006 <=> b006); p c006
