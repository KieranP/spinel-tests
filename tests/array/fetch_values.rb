# frozen_string_literal: true
# Array#fetch_values

p([1, 2, 3].fetch_values(0, 2))

a001 = [1, 2, 3]
p a001.class
p(a001.fetch_values(0, 2))

a002 = [1, 2, 3]
b002 = 0
c002 = 2
p(a002.fetch_values(b002, c002))

a003 = [1, 2, 3]
d003 = (a003.fetch_values(0, 2))
p d003.class
p d003

# single index
p([10, 20, 30].fetch_values(1))
a004 = [10, 20, 30]
e004 = a004.fetch_values(1)
p e004

# Float receiver
p([1.1, 2.2, 3.3].fetch_values(0, 2))
a005 = [1.1, 2.2, 3.3]
p a005.class
p(a005.fetch_values(0, 2))
a006 = [1.1, 2.2, 3.3]
f006 = a006.fetch_values(0, 2)
p f006

# String receiver
p(["a", "b", "c"].fetch_values(0, 2))
a007 = ["a", "b", "c"]
p a007.class
p(a007.fetch_values(0, 2))
a008 = ["a", "b", "c"]
g008 = a008.fetch_values(0, 2)
p g008

# OOB without block raises IndexError
r001 = ([1, 2, 3].fetch_values(0, 5) rescue "oob")
p r001

# with block for OOB (kept last: the uncaught IndexError aborts Spinel's run)
p([1, 2, 3].fetch_values(0, 5) { |i| i * 10 })
a009 = [1, 2, 3]
h009 = a009.fetch_values(0, 5) { |i| i * 10 }
p h009

# several indices, a default block, and an out-of-range miss
h511 = [1, 2, 3, 4]
p h511.fetch_values(0, 2)
w511 = h511.fetch_values(0, 2); p w511
p h511.fetch_values(-1)
p h511.fetch_values
p h511.fetch_values(0, 9) { |i512| i512 * 100 }
w512 = h511.fetch_values(0, 9) { |i513| i513 * 100 }; p w512
w514 = (h511.fetch_values(0, 9) rescue $!.class); p w514
p(%w[a b c].fetch_values(0, 2))
w515 = %w[a b c].fetch_values(0, 2); p w515
