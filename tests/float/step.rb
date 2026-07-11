# frozen_string_literal: true
# Float#step
1.0.step(2.0, 0.5) { |x| print x, " " }
puts
a001 = 1.0; b001 = 2.0; c001 = 0.5
a001.step(b001, c001) { |x| print x, " " }
puts

# Float#step with by: keyword
1.0.step(2.0, by: 0.5) { |x| print x, " " }
puts
a002 = 1.0; b002 = 2.0; c002 = 0.5
a002.step(b002, by: c002) { |x| print x, " " }
puts

# a descending step, and the to:/by: keyword form
5.0.step(1.0, -1.5) { |x| print x, " " }
puts
1.0.step(by: 2.0, to: 9.0) { |x| print x, " " }
puts

# forcing the blockless sequence (to_a / size / first work; only .class differs)
p(1.0.step(3.0, 0.5).to_a)
a003 = 1.0; b003 = 3.0; d003 = (a003.step(b003, 0.5).to_a); p d003
p(1.0.step(3.0, 0.5).size)
p(1.0.step(3.0, 0.5).first(2))
# WONTFIX: See docs/limitations.md - "By design — Range#step / Range#% return a materialized Array, not an ArithmeticSequence"
# p(1.0.step(3.0, 0.5).class)   # Ruby: Enumerator::ArithmeticSequence   Spinel: Array

# non-finite bounds: Ruby yields nothing; Spinel crashes at runtime (NaN) or over-iterates (Inf).
Float::NAN.step(2.0, 0.5) { |x| print x, " " }; puts "nan-recv-done"
1.0.step(Float::NAN, 0.5) { |x| print x, " " }; puts "nan-lim-done"
n004 = 0; Float::INFINITY.step(2.0, 0.5) { |x| n004 += 1; break if n004 > 3 }; p n004

# Float#step with a step of 0 (Ruby raises ArgumentError before iterating)
r880 = (1.0.step(2.0, 0.0) { |i880| break } rescue $!.class); p r880
v881 = 1.0; w881 = 0.0; r881 = (v881.step(2.0, w881) { |i881| break } rescue $!.class); p r881
