# frozen_string_literal: true
# Array#uniq!

p([1, 1, 2, 3].uniq!)

a001 = [1, 1, 2, 3]
p a001.class
a001.uniq!
p a001

a002 = [1, 1, 2, 3]
c002 = a002.uniq!
p c002.class
p c002

p(["a", "a", "b", "c"].uniq!)

a005 = ["a", "a", "b", "c"]
p a005.class
a005.uniq!
p a005

a006 = ["a", "a", "b", "c"]
c006 = a006.uniq!
p c006.class
p c006

# no-change (no duplicates) returns nil
p([1, 2, 3].uniq!)
a007 = [1, 2, 3]; c007 = a007.uniq!; p c007
