# frozen_string_literal: true
# Random#rand
# Random.rand

r001 = Random.new(5)

# Random#rand with no argument -> Float in [0.0, 1.0)
p(r001.rand.class)
p((0.0...1.0).include?(r001.rand))

# Random#rand(Integer) -> Integer in 0...max
p(r001.rand(100).class)
p((0...100).include?(r001.rand(100)))
a002 = 100; p((0...a002).include?(r001.rand(a002)))

# Random#rand(Integer Range) -> Integer within the range
p(r001.rand(3..3))
p(r001.rand(2..8).class)
p((2..8).include?(r001.rand(2..8)))
b003 = (2..8); c003 = r001.rand(b003); p((2..8).include?(c003))

# Random#rand raises ArgumentError for 0, negatives and empty/reversed ranges (matches Ruby)
r004 = (r001.rand(0) rescue $!.class); p r004
r005 = (r001.rand(-5) rescue $!.class); p r005
r006 = (r001.rand(2...2) rescue $!.class); p r006
r007 = (r001.rand(5..2) rescue $!.class); p r007

r010 = (r001.rand(1..) rescue $!.class); p r010
r011 = (r001.rand(..5) rescue $!.class); p r011

# Random#rand(Float Range) stays within the range
p((1.0..2.0).include?(r001.rand(1.0..2.0)))
p((1.0...2.0).include?(r001.rand(1.0...2.0)))

# Random#rand(Float range) returns a Float within the range
p(r001.rand(1.0..2.0).class)
p(r001.rand(2.0..2.0))
c008 = r001.rand(2.0..2.0); p c008

# Random.rand (class method) draws from the default generator
p(Random.rand(10).class)
p((0...10).include?(Random.rand(10)))
p(Random.rand.class)
a009 = Random.rand(10); p((0...10).include?(a009))

# a seeded draw's concrete value is PRNG-algorithm-specific, so probe type + range
p(Random.new(42).rand(1000).class)
p((0...1000).include?(Random.new(42).rand(1000)))
p(Random.new(42).rand.class)
p((0.0...1.0).include?(Random.new(42).rand))

# Random#rand(Float max) -> Float in [0.0, max)
p(r001.rand(2.5).class)
p((0.0...2.5).include?(r001.rand(2.5)))
d020 = r001.rand(2.5); p(d020.class)

# a single-value Integer range draws that value; beginless/endless int ranges raise
p(r001.rand(2..2))
r021 = (r001.rand(..5) rescue $!.class); p r021
d022 = (r001.rand(..5) rescue $!.class); p d022

# same-seed reproducibility holds within one engine for a Float bound too
p(Random.new(9).rand(2.5) == Random.new(9).rand(2.5))

# Infinity/NaN or the wrong error class. rand(0.0) should return a Float in [0,1); Spinel raises.
r023 = (r001.rand(Float::INFINITY) rescue $!.class); p r023
r024 = (r001.rand(-Float::INFINITY) rescue $!.class); p r024
r025 = (r001.rand(Float::NAN) rescue $!.class); p r025
r026 = (r001.rand(1.0..Float::INFINITY) rescue $!.class); p r026
r027 = (r001.rand(0.0).class rescue $!.class); p r027
r028 = (Random.rand(Float::INFINITY) rescue $!.class); p r028

# rand with a Bignum max argument now compiles and returns an Integer.
p(r001.rand(2 ** 70).class)
vr029 = r001.rand(2 ** 70); p(vr029.class)
# WONTFIX: See docs/limitations.md - "By design — A Range object needs Integer/Float/String bounds"
# (a Bignum-bounded Range is now a clean front-end reject, not a C compile abort). Ruby returns an Integer.
# d029 = r001.rand(0...(2 ** 70)); p(d029.class)
