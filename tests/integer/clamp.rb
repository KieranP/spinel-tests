# frozen_string_literal: true
# Integer#clamp
p(10.clamp(1, 5))
a034 = 10; p(a034.clamp(1, 5))
a035 = 10; b035 = 5; p(a035.clamp(1, b035))
a036 = 10; b036 = 5; c036 = (a036.clamp(1, b036)); p c036

# below / within / above
p(0.clamp(1, 5))
p(3.clamp(1, 5))
p(10.clamp(1, 5))
# equal bounds
p(7.clamp(5, 5))
# negative range
p((-10).clamp(-5, -1))
# Range-arg form
p(10.clamp(1..5))
p(3.clamp(1..5))
cl01 = 10; p(cl01.clamp(1..5))
cl02r = (1..5); p(10.clamp(cl02r))
cl03 = 10; cl03r = (1..5); cc03 = (cl03.clamp(cl03r)); p cc03
# beginless / endless ranges
p(10.clamp(..5))
p(0.clamp(1..))
# Float bounds
p(10.clamp(1.5, 5.5))
p(3.clamp(1.5, 5.5))

# Integer#clamp with a nil bound (Ruby 2.7+: nil = open bound)
p(12.clamp(nil, 9)); p(0.clamp(nil, 9))
cnl301 = (5.clamp(1, nil) rescue $!.class); p cnl301
p(5.clamp(nil, nil))

# Float range and lo > hi ArgumentError
p(5.clamp(1.0..10.0))
p(15.clamp(1.0..10.0))
p((5.clamp(10, 1) rescue $!.class))

# Bignum bound (small receiver, result 5) works; Bignum receiver also works.
p(5.clamp(1, 2 ** 64))
cl04 = 5; cl04b = 2 ** 64; cc04 = (cl04.clamp(1, cl04b)); p cc04
p((2 ** 64).clamp(1, 5))
cl05 = 2 ** 64; cc05 = (cl05.clamp(1, 5)); p cc05
# Float bound works under both:
p(5.clamp(1.5, Rational(9, 2)))
cc06 = 5.clamp(1.5, Rational(9, 2)); p cc06
r07 = (5.clamp(1, Rational(9, 2)) rescue $!.class); p r07

r880 = (5.clamp("a", "z") rescue $!.class); p r880
r881 = (5.clamp(1, "z") rescue $!.class); p r881
