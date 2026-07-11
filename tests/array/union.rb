# frozen_string_literal: true
# Array#union

p([1, 2, 3].union([3, 4]))

a001 = [1, 2, 3]
p a001.class
p a001.union([3, 4])

a002 = [1, 2, 3]
b002 = [3, 4]
p b002.class
p a002.union(b002)

a003 = [1, 2, 3]
b003 = [3, 4]
c003 = a003.union(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].union([3.3, 4.4]))

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.union([3.3, 4.4])

a005 = [1.1, 2.2, 3.3]
b005 = [3.3, 4.4]
p b005.class
p a005.union(b005)

a006 = [1.1, 2.2, 3.3]
b006 = [3.3, 4.4]
c006 = a006.union(b006)
p c006.class
p c006

p(["a", "b", "c"].union(["c", "d"]))

a007 = ["a", "b", "c"]
p a007.class
p a007.union(["c", "d"])

a008 = ["a", "b", "c"]
b008 = ["c", "d"]
p b008.class
p a008.union(b008)

a009 = ["a", "b", "c"]
b009 = ["c", "d"]
c009 = a009.union(b009)
p c009.class
p c009

# one, several and zero other arrays
h461 = [1, 2, 3]
p h461.union([3, 4], [5])
w461 = h461.union([3, 4], [5]); p w461
p h461.union
p h461.union([])
p h461.union([1])
w462 = h461.union([4]); p w462
p([].union([1, 1]))
p(%w[a b].union(%w[b c]))
w463 = %w[a b].union(%w[b c]); p w463
