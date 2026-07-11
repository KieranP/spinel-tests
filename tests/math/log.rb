# frozen_string_literal: true
# Math.log

p(Math.log(1))
a001 = Math.log(1)
p a001

p(Math.log(Math::E))
a002 = Math.log(Math::E)
p a002.class
p a002

p(Math.log(10))
p(Math.log(0.5))

# two-argument form (explicit base)
p(Math.log(8, 2))
p(Math.log(100, 10))
p(Math.log(1024, 2))

b003 = 8
p(Math.log(b003))
c003 = Math.log(b003)
p c003

# base in a variable too
d004 = 81
e004 = 3
p(Math.log(d004, e004))
f004 = Math.log(d004, e004)
p f004

# edge / domain
p(Math.log(0))
p(Math.log(0.0))
begin; Math.log(-1); rescue => e005; p e005.class; end
r006 = (Math.log(-1) rescue $!.class); p r006
r007 = (Math.log(-2.0) rescue $!.class); p r007
r008 = (Math.log(-1, 2) rescue $!.class); p r008

# log(1, base) is exactly 0.0 for any base; two-arg with a ULP-safe rounded base
p(Math.log(1, 10))
p(Math.log(1, 2))
p(Math.log(1000, 10).round(12))

# special values
p(Math.log(Float::INFINITY))
p(Math.log(Float::NAN))

# coercion
p(Math.log(Rational(1)))
p(Math.log(Math::E ** 2))

# Bignum argument is truncated to a machine int
p(Math.log(2**100))

# two-argument base variety — round to 12 dp to absorb a 1-ULP diff in the log/log divide path
p(Math.log(100, Math::E).round(12))
le004 = Math.log(100, Math::E); p(le004.round(12))
p(Math.log(8, 2))
p(Math.log(8, 0))
begin; Math.log(8, -2); rescue => e020; p e020.class; end
p(Math.log(8, 1))
n021 = 1
p(Math.log(100, n021))

# two-arg form with a Bignum antilog is truncated too
p(Math.log(2**100, 2))
