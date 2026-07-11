# frozen_string_literal: true
# Array#shuffle
# RNG method: only deterministic invariants are printed (never a raw order).

# empty receiver -> []
p([].shuffle)
a001 = []
c001 = a001.shuffle
p c001

# single element -> [x]
p([1].shuffle)
a002 = [1]
c002 = a002.shuffle
p c002

# sorted result is deterministic
p([3, 1, 2].shuffle.sort)
a003 = [3, 1, 2]
c003 = a003.shuffle.sort
p c003

# length invariant
p([1, 2, 3].shuffle.length)
a004 = [1, 2, 3]
c004 = a004.shuffle.length
p c004

# class invariant
p([1, 2, 3].shuffle.class)
a005 = [1, 2, 3]
c005 = a005.shuffle.class
p c005

# shuffle returns a new array; original is unchanged
a006 = [1, 2, 3]
b006 = a006.shuffle
p a006
p b006.sort

# Float receiver sorted
p([3.3, 1.1, 2.2].shuffle.sort)
a007 = [3.3, 1.1, 2.2]
c007 = a007.shuffle.sort
p c007

# String receiver sorted
p(["c", "a", "b"].shuffle.sort)
a008 = ["c", "a", "b"]
c008 = a008.shuffle.sort
p c008

# String receiver length
p(["c", "a", "b"].shuffle.length)
a009 = ["c", "a", "b"]
c009 = a009.shuffle.length
p c009
