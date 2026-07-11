# frozen_string_literal: true
# Array#to_a

p([1, 2, 3].to_a)

a001 = [1, 2, 3]
p a001.class
p a001.to_a

a002 = [1, 2, 3]
c002 = a002.to_a
p c002.class
p c002

p([1.1, 2.2, 3.3].to_a)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.to_a

a004 = [1.1, 2.2, 3.3]
c004 = a004.to_a
p c004.class
p c004

p(["a", "b", "c"].to_a)

a005 = ["a", "b", "c"]
p a005.class
p a005.to_a

a006 = ["a", "b", "c"]
c006 = a006.to_a
p c006.class
p c006
