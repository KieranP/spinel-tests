# frozen_string_literal: true
# Array#find_index

p([1, 2, 3].find_index(2))

a001 = [1, 2, 3]
p a001.class
p a001.find_index(2)

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.find_index(b002)

a003 = [1, 2, 3]
b003 = 2
c003 = a003.find_index(b003)
p c003.class
p c003

p(["a", "b", "c"].find_index("b"))

a004 = ["a", "b", "c"]
p a004.class
p a004.find_index("b")

a005 = ["a", "b", "c"]
b005 = "b"
p b005.class
p a005.find_index(b005)

a006 = ["a", "b", "c"]
b006 = "b"
c006 = a006.find_index(b006)
p c006.class
p c006

p([-3, -2, -1].find_index(-2))

a007 = [-3, -2, -1]
p a007.class
p a007.find_index(-2)

a008 = [-3, -2, -1]
b008 = -2
p b008.class
p a008.find_index(b008)

a009 = [-3, -2, -1]
b009 = -2
c009 = a009.find_index(b009)
p c009.class
p c009

# a next carrying a value inside the predicate block
p([1, 2].find_index { |i638| next true if i638 == 1; false })
w638 = [1, 2].find_index { |i639| next true if i639 == 1; false }; p w638
