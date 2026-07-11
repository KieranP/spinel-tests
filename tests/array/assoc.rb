# frozen_string_literal: true
# Array#assoc

p([[1, "one"], [2, "two"]].assoc(2))

a001 = [[1, "one"], [2, "two"]]
p a001.class
p(a001.assoc(2))

a002 = [[1, "one"], [2, "two"]]
b002 = 2
p b002.class
p(a002.assoc(b002))

a003 = [[1, "one"], [2, "two"]]
b003 = 2
c003 = (a003.assoc(b003))
p c003.class
p c003

p([["a", 1], ["b", 2]].assoc("b"))

a011 = [["a", 1], ["b", 2]]
p a011.class
p(a011.assoc("b"))

a012 = [["a", 1], ["b", 2]]
b012 = "b"
p b012.class
p(a012.assoc(b012))

a013 = [["a", 1], ["b", 2]]
b013 = "b"
c013 = (a013.assoc(b013))
p c013.class
p c013

p([[:x, 10], [:y, 20]].assoc(:y))

a021 = [[:x, 10], [:y, 20]]
p a021.class
p(a021.assoc(:y))

a022 = [[:x, 10], [:y, 20]]
b022 = :y
p b022.class
p(a022.assoc(b022))

a023 = [[:x, 10], [:y, 20]]
b023 = :y
c023 = (a023.assoc(b023))
p c023.class
p c023

# hits, misses and a non-Array element in the receiver
h261 = [[1, "one"], [2, "two"], [3, "three"]]
p h261.assoc(1)
p h261.assoc(3)
p h261.assoc(9)
w261 = h261.assoc(2); p w261
w262 = h261.assoc(9); p w262
h263 = [%w[a x], %w[b y]]
p h263.assoc("b")
w263 = h263.assoc("b"); p w263
p([].assoc(1))
h264 = [[1]]
p h264.assoc(1)
