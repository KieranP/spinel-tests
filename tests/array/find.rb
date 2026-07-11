# frozen_string_literal: true
# Array#find

p([1, 2, 3, 4].find { |x| x > 2 })

a001 = [1, 2, 3, 4]
p a001.class
p a001.find { |x| x > 2 }

a002 = [1, 2, 3, 4]
c002 = a002.find { |x| x > 2 }
p c002.class
p c002

p(["a", "bb", "ccc"].find { |s| s.size > 1 })

a003 = ["a", "bb", "ccc"]
p a003.class
p a003.find { |s| s.size > 1 }

a004 = ["a", "bb", "ccc"]
c004 = a004.find { |s| s.size > 1 }
p c004.class
p c004

p([1.1, 2.2, 3.3].find { |x| x > 2 })

a005 = [1.1, 2.2, 3.3]
p a005.class
p a005.find { |x| x > 2 }

a006 = [1.1, 2.2, 3.3]
c006 = a006.find { |x| x > 2 }
p c006.class
p c006

# not-found -> nil
p([1, 2, 3].find { |x| x > 9 })

a007 = [1, 2, 3]
c007 = a007.find { |x| x > 9 }
p c007.class
p c007

# ifnone proc supplies the not-found value
p([1, 2].find(-> { -1 }) { |x| x > 9 })

a008 = [1, 2]
c008 = a008.find(-> { -1 }) { |x| x > 9 }
p c008.class
p c008

# empty receiver -> nil
p([].find { |x| x > 9 })

c009 = [].find { |x| x > 9 }
p c009

# symbol-to-proc block
p([1, 2, 3].find(&:even?))

a010 = [1, 2, 3]
c010 = a010.find(&:even?)
p c010

r550 = ([[1, 2], [3, 4]].map { |row550| row550.find { |n550| n550 > 2 } } rescue $!.class); p r550

# a next carrying a value inside the predicate block
p([1, 2].find { |i634| next true if i634 == 1; false })
w634 = [1, 2].find { |i635| next true if i635 == 1; false }; p w634
