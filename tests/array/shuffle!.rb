# frozen_string_literal: true
# Array#shuffle!
# RNG method: only deterministic invariants are printed (never a raw order).

# single element, mutate then inspect variable
a001 = [1]
a001.shuffle!
p a001

# multi element, mutate then print sorted invariant
b002 = [3, 1, 2]
b002.shuffle!
p b002.sort

# length invariant after mutation
c003 = [1, 2, 3]
c003.shuffle!
p c003.length

# returns self
d004 = [1, 2, 3]
e004 = d004.shuffle!
p e004.equal?(d004)

# class invariant after mutation
f005 = [1, 2, 3]
f005.shuffle!
p f005.class

# empty receiver mutate
g006 = []
g006.shuffle!
p g006

# Float receiver, sorted invariant
h007 = [3.3, 1.1, 2.2]
h007.shuffle!
p h007.sort

# String receiver, sorted invariant
i008 = ["c", "a", "b"]
i008.shuffle!
p i008.sort

# String receiver, length invariant
j009 = ["c", "a", "b"]
j009.shuffle!
p j009.length

# return value sorted invariant
k010 = [5, 4, 6]
l010 = k010.shuffle!
p l010.sort
