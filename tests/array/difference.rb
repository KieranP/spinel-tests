# frozen_string_literal: true
# Array#difference

p([1, 2, 3, 4].difference([2, 4]))

a001 = [1, 2, 3, 4]
p a001.class
p a001.difference([2, 4])

a002 = [1, 2, 3, 4]
b002 = [2, 4]
p b002.class
p a002.difference(b002)

a003 = [1, 2, 3, 4]
b003 = [2, 4]
c003 = a003.difference(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].difference([2.2, 4.4]))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.difference([2.2, 4.4])

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = [2.2, 4.4]
p b005.class
p a005.difference(b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = [2.2, 4.4]
c006 = a006.difference(b006)
p c006.class
p c006

p(["a", "b", "c", "d"].difference(["b", "d"]))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.difference(["b", "d"])

a008 = ["a", "b", "c", "d"]
b008 = ["b", "d"]
p b008.class
p a008.difference(b008)

a009 = ["a", "b", "c", "d"]
b009 = ["b", "d"]
c009 = a009.difference(b009)
p c009.class
p c009

# one, several and zero other arrays
g991 = [1, 2, 3, 4]
p g991.difference([2])
v991 = g991.difference([2]); p v991
p g991.difference([2], [3])
v992 = g991.difference([2], [3]); p v992
p g991.difference([])
p g991.difference([9])
p([].difference([1]))
p(%w[a b c].difference(%w[b]))
v993 = %w[a b c].difference(%w[b]); p v993
p g991.difference
v994 = g991.difference; p v994
