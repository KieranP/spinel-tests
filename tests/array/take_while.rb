# frozen_string_literal: true
# Array#take_while

p([1, 2, 3, 4].take_while { |n| n < 3 })

a001 = [1, 2, 3, 4]
p a001.class
p a001.take_while { |n| n < 3 }

a002 = [1, 2, 3, 4]
c002 = a002.take_while { |n| n < 3 }
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].take_while { |n| n < 3.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.take_while { |n| n < 3.0 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.take_while { |n| n < 3.0 }
p c004.class
p c004

p(["a", "b", "c", "d"].take_while { |s| s < "c" })

a005 = ["a", "b", "c", "d"]
p a005.class
p a005.take_while { |s| s < "c" }

a006 = ["a", "b", "c", "d"]
c006 = a006.take_while { |s| s < "c" }
p c006.class
p c006

p [3, 3, 5, 2].take_while.with_index { |v, i| i < 2 }

# a next carrying a value inside the predicate block
p([1, 2].take_while { |i642| next true if i642 == 1; false })
w642 = [1, 2].take_while { |i643| next true if i643 == 1; false }; p w642
