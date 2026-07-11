# frozen_string_literal: true
# Array#drop_while

p([1, 2, 3, 1].drop_while { |n| n < 3 })

a001 = [1, 2, 3, 1]
p a001.class
p(a001.drop_while { |n| n < 3 })

a002 = [1, 2, 3, 1]
c002 = (a002.drop_while { |n| n < 3 })
p c002.class
p c002

p([1.1, 2.2, 3.3, 1.1].drop_while { |n| n < 3.0 })

a003 = [1.1, 2.2, 3.3, 1.1]
p a003.class
p(a003.drop_while { |n| n < 3.0 })

a004 = [1.1, 2.2, 3.3, 1.1]
c004 = (a004.drop_while { |n| n < 3.0 })
p c004.class
p c004

p(["a", "b", "c", "a"].drop_while { |n| n < "c" })

a005 = ["a", "b", "c", "a"]
p a005.class
p(a005.drop_while { |n| n < "c" })

a006 = ["a", "b", "c", "a"]
c006 = (a006.drop_while { |n| n < "c" })
p c006.class
p c006

# a next carrying a value inside the predicate block
p([1, 2].drop_while { |i644| next true if i644 == 1; false })
w644 = [1, 2].drop_while { |i645| next true if i645 == 1; false }; p w644
