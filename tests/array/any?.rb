# frozen_string_literal: true
# Array#any?

p([1, 2, 3].any?(Integer))

a001 = [1, 2, 3]
p a001.class
p(a001.any?(Integer))

a002 = [1, 2, 3]
b002 = Integer
p b002.class
p(a002.any?(b002))

a003 = [1, 2, 3]
b003 = Integer
c003 = (a003.any?(b003))
p c003.class
p c003

p([1.1, 2.2, 3.3].any?(Float))

a011 = [1.1, 2.2, 3.3]
p a011.class
p(a011.any?(Float))

a012 = [1.1, 2.2, 3.3]
b012 = Float
p b012.class
p(a012.any?(b012))

a013 = [1.1, 2.2, 3.3]
b013 = Float
c013 = (a013.any?(b013))
p c013.class
p c013

p(["a", "b", "c"].any?(String))

a021 = ["a", "b", "c"]
p a021.class
p(a021.any?(String))

a022 = ["a", "b", "c"]
b022 = String
p b022.class
p(a022.any?(b022))

a023 = ["a", "b", "c"]
b023 = String
c023 = (a023.any?(b023))
p c023.class
p c023

# no-arg truthiness form
p([nil, false].any?)
a100 = [nil, false]
p a100.any?
a101 = [nil, false]
c101 = a101.any?
p c101

p([nil, 1].any?)
a102 = [nil, 1]
p a102.any?
a103 = [nil, 1]
c103 = a103.any?
p c103

p([].any?)
a104 = []
p a104.any?
a105 = []
c105 = a105.any?
p c105

# block form
p([1, 2, 3].any? { |x| x > 2 })
a106 = [1, 2, 3]
p a106.any? { |x| x > 2 }
a107 = [1, 2, 3]
c107 = a107.any? { |x| x > 2 }
p c107

# pattern arg: empty array, all-false
p([].any?(Integer))
a108 = []
c108 = a108.any?(Integer)
p c108

p([1, 2, 3].any?(String))
a109 = [1, 2, 3]
c109 = a109.any?(String)
p c109

# pattern argument, block and no-arg forms, plus empty receivers
h571 = [1, 2, 3]
p h571.any?(Integer)
w571 = h571.any?(String); p w571
p h571.any? { |x572| x572 > 2 }
w572 = h571.any? { |x573| x573 > 9 }; p w572
p h571.any?
p h571.any?(2..3)
p([].any?)
p([].any?(Integer))
p([nil, false].any?)
p(%w[ab cd].any?(/b/))

# raises NoMethodError naming Array
def pass900 = [[[0, "x"]], 2]
l900, n900 = pass900
p(l900.map { |a900| a900 }.any?)
r901 = l900.map { |a901| a901 }; v901 = r901.any?; p v901

# a next carrying a value inside the predicate block
p([1, 2].any? { |i626| next true if i626 == 1; false })
w626 = [1, 2].any? { |i627| next true if i627 == 1; false }; p w626
