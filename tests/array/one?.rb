# frozen_string_literal: true
# Array#one?

# no-arg truthiness form
p([nil, false, 1].one?)
a001 = [nil, false, 1]
p a001.one?
a002 = [nil, false, 1]
c002 = a002.one?
p c002

p([1, 2].one?)
a003 = [1, 2]
p a003.one?
a004 = [1, 2]
c004 = a004.one?
p c004

p([].one?)
a005 = []
p a005.one?
a006 = []
c006 = a006.one?
p c006

# block form
p([1, 2, 3].one? { |x| x > 2 })
a010 = [1, 2, 3]
p a010.one? { |x| x > 2 }
a011 = [1, 2, 3]
c011 = a011.one? { |x| x > 2 }
p c011

p([1, 2, 3].one? { |x| x > 1 })
a012 = [1, 2, 3]
p a012.one? { |x| x > 1 }
a013 = [1, 2, 3]
c013 = a013.one? { |x| x > 1 }
p c013

# empty array with block -> false
p([].one? { |x| x > 0 })
a014 = []
c014 = a014.one? { |x| x > 0 }
p c014

# Float receiver, block form
p([1.1, 2.2, 3.3].one? { |f| f > 3.0 })
a020 = [1.1, 2.2, 3.3]
p a020.one? { |f| f > 3.0 }
a021 = [1.1, 2.2, 3.3]
c021 = a021.one? { |f| f > 3.0 }
p c021

# String receiver, block form
p(["a", "bb", "ccc"].one? { |s| s.length > 2 })
a022 = ["a", "bb", "ccc"]
p a022.one? { |s| s.length > 2 }
a023 = ["a", "bb", "ccc"]
c023 = a023.one? { |s| s.length > 2 }
p c023

# Class-pattern form
p([1, "a"].one?(Integer))
a030 = [1, "a"]
p a030.one?(Integer)
a031 = [1, "a"]
b031 = Integer
c031 = a031.one?(b031)
p c031

p([1, 2].one?(Integer))
a032 = [1, 2]
c032 = a032.one?(Integer)
p c032

p([1.1, 2].one?(Float))
a033 = [1.1, 2]
b033 = Float
c033 = a033.one?(b033)
p c033

p(["a", 1, 2].one?(String))
a034 = ["a", 1, 2]
c034 = a034.one?(String)
p c034

# pattern argument, block and no-arg forms, plus empty receivers
h591 = [1, 2, 3]
p h591.one? { |x592| x592 == 3 }
w591 = h591.one? { |x593| x593 > 1 }; p w591
p h591.one?
p h591.one?(3..3)
p h591.one?(Integer)
p([].one?)
p([].one?(Integer))
p([nil, 1].one?)
p([7].one?)
p(%w[ab cd].one?(/b/))
