# frozen_string_literal: true
# Array#each_entry

p([1, 2, 3].each_entry.to_a)

a001 = [1, 2, 3]
p a001.class
p a001.each_entry.to_a

a002 = [1, 2, 3]
c002 = a002.each_entry.to_a
p c002.class
p c002

p([1.1, 2.2, 3.3].each_entry.to_a)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.each_entry.to_a

a004 = [1.1, 2.2, 3.3]
c004 = a004.each_entry.to_a
p c004.class
p c004

p(["x", "y", "z"].each_entry.to_a)

a005 = ["x", "y", "z"]
p a005.class
p a005.each_entry.to_a

a006 = ["x", "y", "z"]
c006 = a006.each_entry.to_a
p c006.class
p c006
