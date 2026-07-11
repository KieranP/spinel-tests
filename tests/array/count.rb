# frozen_string_literal: true
# Array#count
p([1, 2, 2, 3].count(2))

a001 = [1, 2, 2, 3]
p a001.class
p a001.count(2)

a002 = [1, 2, 2, 3]
b002 = 2
p b002.class
p a002.count(b002)

a003 = [1, 2, 2, 3]
b003 = 2
c003 = a003.count(b003)
p c003.class
p c003

p([1.1, 2.2, 2.2, 3.3].count(2.2))

a004 = [1.1, 2.2, 2.2, 3.3]
p a004.class
p a004.count(2.2)

a005 = [1.1, 2.2, 2.2, 3.3]
b005 = 2.2
p b005.class
p a005.count(b005)

a006 = [1.1, 2.2, 2.2, 3.3]
b006 = 2.2
c006 = a006.count(b006)
p c006.class
p c006

p(["a", "b", "b", "c"].count("b"))

a007 = ["a", "b", "b", "c"]
p a007.class
p a007.count("b")

a008 = ["a", "b", "b", "c"]
b008 = "b"
p b008.class
p a008.count(b008)

a009 = ["a", "b", "b", "c"]
b009 = "b"
c009 = a009.count(b009)
p c009.class
p c009

# no-arg total length
p([1, 2, 3].count)
a100 = [1, 2, 3]
p a100.count
a101 = [1, 2, 3]
c101 = a101.count
p c101

# block form
p([1, 2, 3, 4].count { |x| x.even? })
a102 = [1, 2, 3, 4]
p a102.count { |x| x.even? }
a103 = [1, 2, 3, 4]
c103 = a103.count { |x| x.even? }
p c103

# absent element -> 0
p([1, 2, 3].count(9))
a104 = [1, 2, 3]
p a104.count(9)
a105 = [1, 2, 3]
c105 = a105.count(9)
p c105

# empty array
p([].count)
a106 = []
p a106.count
a107 = []
c107 = a107.count
p c107

# Array#count matches Complex elements by value
p([Complex(1, 1), Complex(1, 1)].count(Complex(1, 1)))
a108 = [Complex(1, 1), Complex(1, 1)]
c108 = a108.count(Complex(1, 1))
p c108

# strings differing only after an embedded NUL are distinct elements
p(["a\0b", "a\0c"].count("a\0c"))
a109ct = ["a\0b", "a\0c"]; v109ct = a109ct.count("a\0c"); p v109ct

# no-arg, value and block forms, including a nil element
h251 = [1, 2, 2, 3, nil]
p h251.count
p h251.count(2)
p h251.count(nil)
p h251.count(9)
p h251.count { |x252| x252 == 2 }
w252 = h251.count(2); p w252
w253 = h251.count { |x253| x253.nil? }; p w253
p([].count)
p([].count(1))
p(%w[a b a].count("a"))
w254 = %w[a b a].count("a"); p w254
n255 = 2
p h251.count(n255)

# a next carrying a value inside the predicate block
p([1, 2].count { |i632| next true if i632 == 1; false })
w632 = [1, 2].count { |i633| next true if i633 == 1; false }; p w632
