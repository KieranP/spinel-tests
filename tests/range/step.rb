# frozen_string_literal: true
# Range#step
p((1..10).step(2).to_a)
a048 = (1..10); p(a048.step(2).to_a)
a049 = (1..10); b049 = 2; p(a049.step(b049).to_a)
a050 = (1..10); b050 = 2; c050 = (a050.step(b050).to_a); p c050
p((1...10).step(2).to_a)
p((1.0..3.0).step(0.5).to_a)
p((1.0...3.0).step(0.5).to_a)
p((0.0..1.0).step(0.25).to_a)
r051 = []; (1..10).step(3) { |x051| r051 << x051 }; p r051
r052 = []; (1.0..2.0).step(0.5) { |x052| r052 << x052 }; p r052
p((1..10).step(3) { |x053| }.class)
p((1..10).step(1).to_a)
p((5..1).step(2).to_a)

p((1..10).step(4).to_a)
p((-5..5).step(5).to_a)
p((1..10).step(2.5).to_a)
p((1..10).step(1.0).to_a)
p((3..3).step(1).to_a)
r054 = ((1..10).step(0) rescue $!.class); p r054
a055 = (1..10); b055 = 3; r055 = []; a055.step(b055) { |x055| r055 << x055 }; p r055
r056 = (("a".."e").step(2).to_a rescue $!.class); p r056
a057 = ("a".."e"); r057 = (a057.step(2).to_a rescue $!.class); p r057
r058 = []; ("a".."e").step(2) { |s058| r058 << s058 }; p r058
r059 = []; (1..).step(3) { |x059| break if x059 > 10; r059 << x059 }; p r059
r060 = ((..5).step(2) { |x060| x060 } rescue $!.class); p r060
# A bad stride is rejected at the call, not deferred to enumeration, so the blockless
# forms below raise where Ruby answers a lazy Enumerator (and .size answers nil).
# WONTFIX: See docs/limitations.md - "By design — Range#step, Range#% and Numeric#step return a materialized Array, not an ArithmeticSequence"
# r061 = ((1..10).step("x") rescue $!.class); p r061
# r062 = ((1.0..10.0).step("x") rescue $!.class); p r062
# r063 = (("a".."e").step("x") rescue $!.class); p r063
# b064 = "x"; r064 = ((1..10).step(b064) rescue $!.class); p r064
# r065 = ((1..10).step(:s) rescue $!.class); p r065
# r066 = ((1..10).step([1]) rescue $!.class); p r066
# r067 = ((1..10).step(nil) rescue $!.class); p r067
# r068 = ((1..10).step("x").size rescue $!.class); p r068
# Consuming the sequence agrees: both raise TypeError.
r069 = ((1..10).step("x").to_a rescue $!.class); p r069
r070 = ((1..10).step("x") { |x070| x070 } rescue $!.class); p r070
# WONTFIX: See docs/limitations.md - "By design — Range#step, Range#% and Numeric#step return a materialized Array, not an ArithmeticSequence"
# p((1..).step(2).first(3))
