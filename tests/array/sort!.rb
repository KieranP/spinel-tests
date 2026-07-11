# frozen_string_literal: true
# Array#sort!
p([3, 1, 2].sort!)

a001 = [3, 1, 2]
p a001.class
p a001.sort!

a002 = [3, 1, 2]
c002 = a002.sort!
p c002.class
p c002

p([3.3, 1.1, 2.2].sort!)

a003 = [3.3, 1.1, 2.2]
p a003.class
p a003.sort!

a004 = [3.3, 1.1, 2.2]
c004 = a004.sort!
p c004.class
p c004

p(["ccc", "a", "bb"].sort!)

a005 = ["ccc", "a", "bb"]
p a005.class
p a005.sort!

a006 = ["ccc", "a", "bb"]
c006 = a006.sort!
p c006.class
p c006
