# frozen_string_literal: true
require 'set'

# Array#to_set
p([1, 2, 3].to_set.to_a.sort)

a001 = [1, 2, 3]
p a001.class
p a001.to_set.class
p a001.to_set.to_a.sort

a002 = [1, 2, 3]
c002 = a002.to_set
p c002.class
p c002.to_a.sort

# duplicates collapse
p([1, 2, 2, 3, 3, 3].to_set.to_a.sort)

a003 = [1, 2, 2, 3, 3, 3]
c003 = a003.to_set
p c003.size
p c003.to_a.sort

# strings
p(["a", "b", "a", "c"].to_set.to_a.sort)

a004 = ["a", "b", "a", "c"]
c004 = a004.to_set
p c004.to_a.sort

# floats
p([1.1, 2.2, 1.1].to_set.to_a.sort)

a005 = [1.1, 2.2, 1.1]
c005 = a005.to_set
p c005.to_a.sort

# membership
a006 = [1, 2, 3]
s006 = a006.to_set
p s006.include?(2)
p s006.include?(9)

# empty receiver
p([].to_set.to_a)
a007 = []
c007 = a007.to_set
p c007.to_a
