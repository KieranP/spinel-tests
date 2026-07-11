# frozen_string_literal: true
# Enumerator#each_cons
# Array#each_cons with a block, and the no-block enumerator form, work under both:
p([1, 2, 3, 4].each_cons(2).to_a)
a001 = [1, 2, 3, 4]; b001 = a001.each_cons(2).to_a; p b001
[1, 2, 3].each_cons(2) { |pair| p pair }

# Inline lazy each_cons chains (finite or infinite source) work under both:
r344 = ((1..Float::INFINITY).lazy.select { |n344| n344 > 2 }.each_cons(2).first(3) rescue $!.class); p r344
r099 = ((1..Float::INFINITY).lazy.each_cons(2).map { |a099, b099| a099 + b099 }.first(3) rescue $!.class); p r099
# An infinite lazy enumerator stored in a variable, then each_cons on the variable:
s467 = (1..Float::INFINITY).lazy.select { |n467| n467 > 3 }; r467 = (s467.each_cons(2).first(2) rescue $!.class); p r467
# Re-lazifying each_cons of a variable-held lazy enumerator (finite and infinite source):
s852 = (2..Float::INFINITY).lazy.select { |n852| n852 > 1 }; r852 = (s852.each_cons(2).lazy.first(2) rescue $!.class); p r852
s853 = (2..Float::INFINITY).lazy.select { |n853| n853 > 1 }; p s853.each_cons(2).lazy.first(2)
s854 = (2..30).lazy.select { |n854| n854 > 1 }; p s854.each_cons(2).lazy.first(2)
s855 = (2..30).lazy.select { |n855| n855 > 1 }; r855 = s855.each_cons(2).lazy.first(2); p r855

# the block form yields the right pairs but hands back the wrong value
p([1, 2, 3].each.each_cons(2) { |c900| c900 })
v901 = [1, 2, 3].each.each_cons(2) { |c901| p c901 }; p(v901)
# a Range-backed external Enumerator works; the Array-backed one is refused
p((1..5).each.each_cons(2).to_a)
v902 = (1..5).each.each_cons(2).to_a; p(v902)
p([1, 2, 3, 4].each.each_cons(2).to_a)
