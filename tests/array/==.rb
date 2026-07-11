# frozen_string_literal: true
# Array#==

p([1, 2, 3] == [1, 2, 3])

a001 = [1, 2, 3]
p a001.class
p(a001 == [1, 2, 4])

a002 = [1, 2, 3]
b002 = [1, 2, 4]
p b002.class
p(a002 == b002)

a003 = [1, 2, 3]
b003 = [1, 2, 3]
c003 = (a003 == b003)
p c003.class
p c003

p([1.1, 2.2, 3.3] == [1.1, 2.2, 3.3])

a011 = [1.1, 2.2, 3.3]
p a011.class
p(a011 == [1.1, 2.2, 3.0])

a012 = [1.1, 2.2, 3.3]
b012 = [1.1, 2.2, 3.0]
p b012.class
p(a012 == b012)

a013 = [1.1, 2.2, 3.3]
b013 = [1.1, 2.2, 3.3]
c013 = (a013 == b013)
p c013.class
p c013

p(["a", "b", "c"] == ["a", "b", "c"])

a021 = ["a", "b", "c"]
p a021.class
p(a021 == ["a", "b", "d"])

a022 = ["a", "b", "c"]
b022 = ["a", "b", "d"]
p b022.class
p(a022 == b022)

a023 = ["a", "b", "c"]
b023 = ["a", "b", "c"]
c023 = (a023 == b023)
p c023.class
p c023

# Array#== compares Complex elements by value
p([Complex(1, 1)] == [Complex(1, 1)])
a024 = [Complex(1, 1)]
b024 = [Complex(1, 1)]
c024 = (a024 == b024)
p c024
