# frozen_string_literal: true
# Kernel#rand

# no argument -> Float in [0.0, 1.0)
p(rand.class)
a001 = rand; p(a001.class)
p((0.0...1.0).include?(rand))

# rand(Integer) -> Integer in 0...max
p(rand(10).class)
p((0...10).include?(rand(10)))
a002 = rand(10); p(a002.class)
b003 = 10; c003 = rand(b003); p((0...b003).include?(c003))

# rand(Float >= 1) -> Integer in 0...max.to_i-ish (truncated max)
p(rand(3.5).class)
p((0...3).include?(rand(3.5)))
a004 = 3.5; c004 = rand(a004); p((0...3).include?(c004))

# rand(Integer Range) -> Integer within the range
p(rand(2..5).class)
p((2..5).include?(rand(2..5)))
p(rand(1..1))
a005 = (2..5); c005 = rand(a005); p((2..5).include?(c005))

# rand(Float Range) with whole-number bounds -> Float within the range
p((1.0..2.0).include?(rand(1.0..2.0)))
p((1.0...2.0).include?(rand(1.0...2.0)))
p(rand(1.0..1.0))
p(rand(3.0..3.0))

# rand(Float >= 1) truncates the maximum to an Integer (rand(1.5) -> only 0)
p(rand(1.5))
p(rand(1.5).class)

# rand(0) behaves like rand (Float in [0.0,1.0)); rand(-n) -> Integer in 0...n.abs
p(rand(0).class)
p((0.0...1.0).include?(rand(0)))
p((0...5).include?(rand(-5)))
a007 = -5; c007 = rand(a007); p((0...5).include?(c007))
a006 = 0; c006 = rand(a006); p(c006.class)
p(rand(0.0).class)

# rand(empty/reversed Range) returns nil
r008 = (rand(2...2) rescue $!.class); p r008
r009 = (rand(5..2) rescue $!.class); p r009

# rand over an endless/beginless Range raises Errno::EDOM
r011 = (rand(1..) rescue $!.class); p r011
r012 = (rand(1.0..) rescue $!.class); p r012
r013 = (rand(..5) rescue $!.class); p r013

# rand(x.y..x.y) keeps the fractional bound (2.5..2.5 -> 2.5)
p(rand(2.5..2.5))
a010 = (2.5..2.5); c010 = rand(a010); p c010

# a seeded draw's concrete value is PRNG-algorithm-specific, so probe type + range
srand(42); p(rand(100).class)
srand(42); p((0...100).include?(rand(100)))
