# frozen_string_literal: true
# Integer.sqrt
p(Integer.sqrt(16))
p(Integer.sqrt(17))
p(Integer.sqrt(0))
p(Integer.sqrt(1))
p(Integer.sqrt(2))
p(Integer.sqrt(1000000))
a001 = 100; p(Integer.sqrt(a001))
b002 = 99; c002 = Integer.sqrt(b002); p c002
p(Integer.sqrt(16).class)

# Negative argument raises Math::DomainError:
r003 = (Integer.sqrt(-1) rescue $!.class); p r003

# Bignum argument:
p(Integer.sqrt(2 ** 100))
d004 = Integer.sqrt(2 ** 100); p d004

r880 = (Integer.sqrt("x") rescue $!.class); p r880

# Integer.sqrt over a run of perfect squares and the value just below each
p((0..8).map { |sq1| Integer.sqrt(sq1 * sq1) })
vq1 = (1..8).map { |sq2| Integer.sqrt(sq2 * sq2 - 1) }; p vq1
