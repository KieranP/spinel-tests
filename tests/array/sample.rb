# frozen_string_literal: true
# Array#sample
# RNG method: only deterministic invariants are printed (never a raw pick).

# empty receiver -> nil
p([].sample)
a001 = []
c001 = a001.sample
p c001

# single element -> that element
p([7].sample)
a002 = [7]
c002 = a002.sample
p c002

# sample(0) -> []
p([1, 2, 3].sample(0))
a003 = [1, 2, 3]
c003 = a003.sample(0)
p c003

# n >= size returns all elements (order random) -> sort is deterministic
p([1, 2, 3].sample(5).sort)
a004 = [1, 2, 3]
c004 = a004.sample(5).sort
p c004

# class of a single pick
p([1, 2, 3].sample.class)
a005 = [1, 2, 3]
c005 = a005.sample.class
p c005

# membership invariant
v006 = [1, 2, 3].sample
p(v006 >= 1 && v006 <= 3)
a006 = [1, 2, 3]
w006 = a006.sample
p(w006 >= 1 && w006 <= 3)

# Float receiver: n >= size sorted
p([1.1, 2.2, 3.3].sample(9).sort)
a007 = [1.1, 2.2, 3.3]
c007 = a007.sample(9).sort
p c007

# String receiver: n >= size sorted
p(["a", "b", "c"].sample(9).sort)
a008 = ["a", "b", "c"]
c008 = a008.sample(9).sort
p c008

# single-element receiver, sample(n) always returns [x]
p([42].sample(3))
a009 = [42]
c009 = a009.sample(3)
p c009

p([].sample(2))
p([].sample(0))
a010 = []
c010 = a010.sample(0)
p c010

# String receiver single pick class
p(["x", "y", "z"].sample.class)
a011 = ["x", "y", "z"]
c011 = a011.sample.class
p c011

r012 = ([1, 2, 3].sample(random: Random.new(1)) rescue $!.class)
p(r012.nil? || [1, 2, 3].include?(r012))

# Array#sample(n) on an Array read out of a container raises NoMethodError.
zp10 = [["a", "b", "c"]]
zp11 = (zp10[0].sample(2).length rescue $!.class); p zp11
# the no-arg form on the same receiver is correct
zp12 = (zp10[0].sample.class rescue $!.class); p zp12
# an Integer inner array is correct
zp13 = [[1, 2, 3]]; p zp13[0].sample(2).length
