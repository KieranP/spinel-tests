# frozen_string_literal: true
# Array#|

p([1, 2, 3] | [2, 3, 4])

a001 = [1, 2, 3]
p a001.class
p(a001 | [2, 3, 4])

a002 = [1, 2, 3]
b002 = [2, 3, 4]
p b002.class
p(a002 | b002)

a003 = [1, 2, 3]
b003 = [2, 3, 4]
c003 = (a003 | b003)
p c003.class
p c003

p([1.1, 2.2] | [2.2, 3.3])

a011 = [1.1, 2.2]
p a011.class
p(a011 | [2.2, 3.3])

a012 = [1.1, 2.2]
b012 = [2.2, 3.3]
p b012.class
p(a012 | b012)

a013 = [1.1, 2.2]
b013 = [2.2, 3.3]
c013 = (a013 | b013)
p c013.class
p c013

p(["a", "b"] | ["b", "c"])

a021 = ["a", "b"]
p a021.class
p(a021 | ["b", "c"])

a022 = ["a", "b"]
b022 = ["b", "c"]
p b022.class
p(a022 | b022)

a023 = ["a", "b"]
b023 = ["b", "c"]
c023 = (a023 | b023)
p c023.class
p c023

# strings differing only after an embedded NUL are distinct elements
p((["a\0b"] | ["a\0c"]).map(&:bytes))
a024pp = ["a\0b"]; b024pp = ["a\0c"]; v024pp = (a024pp | b024pp).map(&:bytes); p v024pp
