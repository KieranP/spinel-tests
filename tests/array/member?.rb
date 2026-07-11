# frozen_string_literal: true
# Array#member?
p([1, 2, 3].member?(2))

a001 = [1, 2, 3]
p a001.class
p a001.member?(2)

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.member?(b002)

a003 = [1, 2, 3]
b003 = 2
c003 = a003.member?(b003)
p c003.class
p c003

p(["a", "b", "c"].member?("b"))

a007 = ["a", "b", "c"]
p a007.class
p a007.member?("b")

a008 = ["a", "b", "c"]
b008 = "b"
p b008.class
p a008.member?(b008)

a009 = ["a", "b", "c"]
b009 = "z"
c009 = a009.member?(b009)
p c009.class
p c009

# element not present
p([1, 2, 3].member?(5))
a100 = [1, 2, 3]
p a100.member?(5)
a101 = [1, 2, 3]
c101 = a101.member?(5)
p c101

# member? nil (poly array)
p([1, nil, 2].member?(nil))
a102 = [1, nil, 2]
p a102.member?(nil)
a103 = [1, nil, 2]
c103 = a103.member?(nil)
p c103

# on empty array
p([].member?(1))
# empty array held in a VARIABLE
a104 = []
p a104.member?(1)
a105 = []
c105 = a105.member?(1)
p c105

# float
p([1.1, 2.2].member?(2.2))
a106 = [1.1, 2.2]
p a106.member?(2.2)
a107 = [1.1, 2.2]
c107 = a107.member?(9.9)
p c107
