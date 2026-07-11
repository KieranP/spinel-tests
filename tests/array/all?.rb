# frozen_string_literal: true
# Array#all?

p([1, 2, 3].all? { |n| n > 0 })

a001 = [1, 2, 3]
p a001.class
p(a001.all? { |n| n > 0 })

a002 = [1, 2, 3]
c002 = (a002.all? { |n| n > 0 })
p c002.class
p c002

p([1.1, 2.2, 3.3].all? { |f| f > 0.0 })

a011 = [1.1, 2.2, 3.3]
p a011.class
p(a011.all? { |f| f > 0.0 })

a012 = [1.1, 2.2, 3.3]
c012 = (a012.all? { |f| f > 0.0 })
p c012.class
p c012

p(["a", "bb", "ccc"].all? { |s| s.length > 0 })

a021 = ["a", "bb", "ccc"]
p a021.class
p(a021.all? { |s| s.length > 0 })

a022 = ["a", "bb", "ccc"]
c022 = (a022.all? { |s| s.length > 0 })
p c022.class
p c022

# no-arg truthiness form
p([1, 2, 3].all?)
a100 = [1, 2, 3]
p a100.all?
a101 = [1, 2, 3]
c101 = a101.all?
p c101

p([1, nil, 3].all?)
a102 = [1, nil, 3]
p a102.all?
a103 = [1, nil, 3]
c103 = a103.all?
p c103

p([].all?)
a104 = []
p a104.all?
a105 = []
c105 = a105.all?
p c105

# pattern argument: Class (supported)
p([1, 2, 3].all?(Integer))
a110 = [1, 2, 3]
p a110.all?(Integer)
a111 = [1, 2, 3]
b111 = Integer
c111 = a111.all?(b111)
p c111

p([1, "x"].all?(Integer))
a112 = [1, "x"]
c112 = a112.all?(Integer)
p c112

p([1.1, 2.2].all?(Float))
a113 = [1.1, 2.2]
b113 = Float
c113 = a113.all?(b113)
p c113

# empty array with block -> true
p([].all? { |n| n > 0 })
a120 = []
c120 = a120.all? { |n| n > 0 }
p c120

# block that fails for one element
p([1, 2, 3].all? { |n| n < 3 })
a121 = [1, 2, 3]
c121 = a121.all? { |n| n < 3 }
p c121

# non-Class pattern arguments: value / Range / Regexp
p([2, 2].all?(2))
a130 = [2, 2]
c130 = a130.all?(2)
p c130
p([1, 2, 3].all?(1..5))
p(["ab", "ac"].all?(/a/))

p([nil, nil].all?(nil))
a131 = [nil, nil]
c131 = a131.all?(nil)
p c131

def safe134(pl = []) = pl.each_with_index.all? { |c, r| c > r }
p safe134([1, 2, 3])

# pattern argument, block and no-arg forms, plus empty receivers
h561 = [1, 2, 3]
p h561.all?(Integer)
w561 = h561.all?(Integer); p w561
p h561.all?(String)
p h561.all? { |x562| x562 > 0 }
w562 = h561.all? { |x563| x563 > 2 }; p w562
p h561.all?
p h561.all?(1..3)
p([].all?)
p([].all?(Integer))
p([nil, 1].all?)
p(%w[ab cd].all?(/b/))

# raises NoMethodError naming Array; the block form aborts the C build, so it stays commented
def pass900 = [[[0, "x"]], 2]
l900, n900 = pass900
p(l900.map { |a900| a900 }.all?)
r901 = l900.map { |a901| a901 }; v901 = r901.all?; p v901
p(l900.map { |a902| a902 }.all? { |x902| true })

# a next carrying a value inside the predicate block
p([1, 2, 3].all? { |i628| next true if i628 == 2; i628.odd? })
w628 = [1, 2, 3].all? { |i629| next true if i629 == 2; i629.odd? }; p w628
