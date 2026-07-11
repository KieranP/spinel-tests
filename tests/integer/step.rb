# frozen_string_literal: true
# Integer#step
p(1.step(10, 3).to_a)
a078 = 1; p(a078.step(10, 3).to_a)
a079 = 1; b079 = 10; p(a079.step(b079, 3).to_a)
a080 = 1; b080 = 10; c080 = (a080.step(b080, 3).to_a); p c080

# block form collecting into an array
r001 = []; 1.step(10, 3) { |i| r001 << i }; p r001
a081 = 1; b081 = 10; r081 = []; a081.step(b081, 3) { |i| r081 << i }; p r081

# default step of 1
p(1.step(5).to_a)
a082 = 1; b082 = 5; c082 = (a082.step(b082).to_a); p c082

# descending with a negative step
p(10.step(1, -3).to_a)
a083 = 10; b083 = 1; c083 = (a083.step(b083, -3).to_a); p c083

# step returns the receiver from the block form
p(1.step(5) { |i| i })
a084 = 1; b084 = 5; c084 = (a084.step(b084) { |i| i }); p c084

r002 = 1.step { |i| break i if i > 3 }; p r002

# empty ranges (limit already passed)
p(5.step(1).to_a)
p(1.step(10, -1).to_a)

# keyword args: by / to
p(1.step(by: 2, to: 9).to_a)
p(1.step(to: 9, by: 2).to_a)
a085 = 1; c085 = (a085.step(by: 2, to: 9).to_a); p c085

# Float step yields Floats
p(1.step(2, 0.5).to_a)
a086 = 1; c086 = (a086.step(2, 0.5).to_a); p c086

# descending with a negative Float step
p(3.step(1, -0.5).to_a)
a087 = 3; c087 = (a087.step(1, -0.5).to_a); p c087

# Bignum limit / step (result [1] - the arg type, not magnitude, aborts).
p(1.step(5, 2 ** 64).to_a)
a088 = 1; b088 = 2 ** 64; c088 = (a088.step(5, b088).to_a); p c088

# no-block, no-arg returns an infinite ArithmeticSequence enumerator.
# WONTFIX: See docs/limitations.md - "By design — Range#step / Range#% return a materialized Array, not an ArithmeticSequence"
# p(1.step.size)
# p(1.step.first(3))

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir812(x812); x812.step(3, 1) { |i812| nil }; end
p ir812(1)
v812 = ir812(1); p v812
# control: the same call with the result consumed explicitly
def ic812(y812); return y812.step(3, 1) { |i812| nil }; end
p ic812(1)

# Integer#step with a step of 0 (Ruby raises ArgumentError before iterating)
r881 = (1.step(10, 0) { |i881| break } rescue $!.class); p r881
v882 = 1; w882 = 0; r882 = (v882.step(10, w882) { |i882| break } rescue $!.class); p r882
r883 = (1.step(by: 0, to: 10) { |i883| break } rescue $!.class); p r883
p((1.step(10, 0).to_a.size rescue $!.class))

r884 = (1.step("z", 1).to_a rescue $!.class); p r884
