# frozen_string_literal: true
# Array#fill

p([1, 2, 3].fill(0))

a001 = [1, 2, 3]
p a001.class
p a001.fill(0)

a002 = [1, 2, 3]
b002 = 0
p b002.class
p a002.fill(b002)

a003 = [1, 2, 3]
b003 = 0
c003 = a003.fill(b003)
p c003.class
p c003

p(["a", "b", "c"].fill("x"))

a004 = ["a", "b", "c"]
p a004.class
p a004.fill("x")

a005 = ["a", "b", "c"]
b005 = "x"
p b005.class
p a005.fill(b005)

a006 = ["a", "b", "c"]
b006 = "x"
c006 = a006.fill(b006)
p c006.class
p c006

p([1.1, 2.2, 3.3].fill(9.9))

a007 = [1.1, 2.2, 3.3]
p a007.class
p a007.fill(9.9)

a008 = [1.1, 2.2, 3.3]
b008 = 9.9
p b008.class
p a008.fill(b008)

a009 = [1.1, 2.2, 3.3]
b009 = 9.9
c009 = a009.fill(b009)
p c009.class
p c009

p([1, 2, 3, 4].fill(0, 2))
a010 = [1, 2, 3, 4]; a010.fill(0, 2); p a010

p([1, 2, 3, 4].fill(0, 1, 2))
a011 = [1, 2, 3, 4]; a011.fill(0, 1, 2); p a011

p([1, 2, 3].fill { |i| i * i })
a012 = [1, 2, 3]; a012.fill { |i| i * i }; p a012

p [1, 2, 3, 4, 5].fill("x", 1, 2)
a013 = [1, 2, 3, 4, 5]; a013.fill("x", 1, 2); p a013
p [1, 2, 3, 4, 5].fill("x", 1..3)
a014 = [1, 2, 3, 4, 5]; a014.fill("x", 1..3); p a014

# fill beyond current size grows the array with the value
p([1, 2, 3].fill(0, 1, 5))
a020 = [1, 2, 3]; a020.fill(0, 1, 5); p a020

# negative start index
p([1, 2, 3, 4, 5].fill(9, -2))
a021 = [1, 2, 3, 4, 5]; a021.fill(9, -2); p a021

# block form with start
p([0, 0, 0, 0].fill(2) { |i| i * 10 })
a022 = [0, 0, 0, 0]; a022.fill(2) { |i| i * 10 }; p a022

# empty receiver
p([].fill(1))
a023 = []; a023.fill(1); p a023

# A two-element splat drops the length, filling to the end: Ruby [9, 9, 3].
k096 = [0, 2]
a096 = [1, 2, 3]; a096.fill(9, *k096); p a096
a097 = [1, 2, 3]; c097 = a097.fill(9, *k096); p c097
# control: the same arguments spread positionally
a098 = [1, 2, 3]; a098.fill(9, 0, 2); p a098

# Range argument: a bounded or beginless Range fills, a negative end is a no-op.
p([1, 2, 3, 4, 5].fill(9, 1..3))
g801 = [1, 2, 3, 4, 5]; g801.fill(9, 1..3); p g801
p([1, 2, 3, 4, 5].fill(9, 1...3))
g802 = [1, 2, 3, 4, 5]; g802.fill(9, 1...3); p g802
p([1, 2, 3, 4, 5].fill(9, ..2))
g803 = [1, 2, 3, 4, 5]; g803.fill(9, ..2); p g803
p([1, 2, 3, 4, 5].fill(9, -3..4))
g804 = [1, 2, 3, 4, 5]; g804.fill(9, -3..4); p g804
p([1, 2, 3, 4, 5].fill(9, 1..-1))
g805 = [1, 2, 3, 4, 5]; g805.fill(9, 1..-2); p g805
g806 = [1, 2, 3, 4, 5]; g806.fill(9, -3..-1); p g806
g807 = ["a", "b", "c"]; g807.fill("x", 1..-1); p g807
p([1, 2, 3, 4, 5].fill(9, 2..))
g808 = [1, 2, 3, 4, 5]; g808.fill(9, 2..); p g808

# block form with a Range, and with a negative start
p([1, 2, 3, 4, 5].fill(1..3) { |i809| i809 * 10 })
g810 = [1, 2, 3, 4, 5]; g810.fill(1..-1) { |i810| i810 * 10 }; p g810
g811 = [1, 2, 3, 4, 5]; g811.fill(-2) { |i811| i811 * 10 }; p g811
g812 = [1, 2, 3, 4, 5]; v812 = g812.fill(1, 3) { |i812| i812 + 100 }; p v812

# a non-Integer length raises TypeError in CRuby
g813 = (([1, 2].fill(0, "x")) rescue $!.class); p g813
