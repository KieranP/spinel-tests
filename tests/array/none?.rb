# frozen_string_literal: true
# Array#none?

# no-arg truthiness form
p([nil, false].none?)
a001 = [nil, false]
p a001.none?
a002 = [nil, false]
c002 = a002.none?
p c002

p([nil, 1].none?)
a003 = [nil, 1]
p a003.none?
a004 = [nil, 1]
c004 = a004.none?
p c004

p([].none?)
a005 = []
p a005.none?
a006 = []
c006 = a006.none?
p c006

# block form
p([1, 2, 3].none? { |x| x > 5 })
a010 = [1, 2, 3]
p a010.none? { |x| x > 5 }
a011 = [1, 2, 3]
c011 = a011.none? { |x| x > 5 }
p c011

p([1, 2, 3].none? { |x| x > 2 })
a012 = [1, 2, 3]
p a012.none? { |x| x > 2 }
a013 = [1, 2, 3]
c013 = a013.none? { |x| x > 2 }
p c013

# empty array with block -> true
p([].none? { |x| x > 0 })
a014 = []
c014 = a014.none? { |x| x > 0 }
p c014

# Float receiver, block form
p([1.1, 2.2, 3.3].none? { |f| f > 5.0 })
a020 = [1.1, 2.2, 3.3]
p a020.none? { |f| f > 5.0 }
a021 = [1.1, 2.2, 3.3]
c021 = a021.none? { |f| f > 5.0 }
p c021

# String receiver, block form
p(["a", "bb", "ccc"].none? { |s| s.length > 5 })
a022 = ["a", "bb", "ccc"]
p a022.none? { |s| s.length > 5 }
a023 = ["a", "bb", "ccc"]
c023 = a023.none? { |s| s.length > 5 }
p c023

# pattern argument: Class (supported)
p([1, 2, 3].none?(String))
a030 = [1, 2, 3]
p a030.none?(String)
a031 = [1, 2, 3]
b031 = String
c031 = a031.none?(b031)
p c031

p(["a", "b"].none?(String))
a032 = ["a", "b"]
c032 = a032.none?(String)
p c032

p([1.1, 2.2].none?(Integer))
a033 = [1.1, 2.2]
b033 = Integer
c033 = a033.none?(b033)
p c033

# pattern argument: value (supported)
p([2, 2].none?(3))
a034 = [2, 2]
c034 = a034.none?(3)
p c034

# Regexp pattern
p(["ab", "cd"].none?(/a/))
a040 = ["ab", "cd"]
c040 = a040.none?(/a/)
p c040

# Range pattern
p([1, 2, 3].none?(4..9))
a041 = [1, 2, 3]
c041 = a041.none?(4..9)
p c041

# pattern argument, block and no-arg forms, plus empty receivers
h581 = [1, 2, 3]
p h581.none?(String)
w581 = h581.none?(Integer); p w581
p h581.none? { |x582| x582 > 9 }
w582 = h581.none? { |x583| x583 > 2 }; p w582
p h581.none?
p h581.none?(9..10)
p([].none?)
p([].none?(Integer))
p([nil, false].none?)
p(%w[ab cd].none?(/z/))

# raises NoMethodError naming Array
def pass900 = [[[0, "x"]], 2]
l900, n900 = pass900
p(l900.map { |a900| a900 }.none?)
r901 = l900.map { |a901| a901 }; v901 = r901.none?; p v901

# a next carrying a value inside the predicate block
p([1, 2].none? { |i630| next true if i630 == 1; false })
w630 = [1, 2].none? { |i631| next true if i631 == 1; false }; p w630
