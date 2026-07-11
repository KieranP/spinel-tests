# frozen_string_literal: true
# Array#rassoc

p([[1, "a"], [2, "b"]].rassoc("b"))

a001 = [[1, "a"], [2, "b"]]
p a001.class
p(a001.rassoc("b"))

a002 = [[1, "a"], [2, "b"]]
b002 = "b"
p b002.class
p(a002.rassoc(b002))

a003 = [[1, "a"], [2, "b"]]
b003 = "b"
c003 = (a003.rassoc(b003))
p c003.class
p c003

# not-found -> nil
p([[1, "a"], [2, "b"]].rassoc("z"))
a004 = [[1, "a"], [2, "b"]]
c004 = a004.rassoc("z")
p c004

# Int values
p([[1, 10], [2, 20]].rassoc(20))

a010 = [[1, 10], [2, 20]]
p a010.class
p(a010.rassoc(20))

a011 = [[1, 10], [2, 20]]
b011 = 20
p b011.class
p(a011.rassoc(b011))

a012 = [[1, 10], [2, 20]]
b012 = 20
c012 = (a012.rassoc(b012))
p c012.class
p c012

# Int values, not found
p([[1, 10], [2, 20]].rassoc(99))
a013 = [[1, 10], [2, 20]]
c013 = a013.rassoc(99)
p c013

# Symbol values
p([[:x, 10], [:y, 20]].rassoc(20))
a020 = [[:x, 10], [:y, 20]]
p(a020.rassoc(20))
a021 = [[:x, 10], [:y, 20]]
c021 = a021.rassoc(20)
p c021

# hits, misses and a String key column
h271 = [[1, "one"], [2, "two"], [3, "three"]]
p h271.rassoc("two")
p h271.rassoc("x")
w271 = h271.rassoc("one"); p w271
w272 = h271.rassoc("x"); p w272
h273 = [%w[a x], %w[b y]]
p h273.rassoc("y")
w273 = h273.rassoc("y"); p w273
p([].rassoc(1))
