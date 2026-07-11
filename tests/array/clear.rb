# frozen_string_literal: true
# Array#clear

p([1, 2, 3].clear)

a001 = [1, 2, 3]
p a001.class
p a001.clear

a002 = [1, 2, 3]
c002 = a002.clear
p c002.class
p c002

p([1.1, 2.2, 3.3].clear)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.clear

a004 = [1.1, 2.2, 3.3]
c004 = a004.clear
p c004.class
p c004

p(["a", "b", "c"].clear)

a005 = ["a", "b", "c"]
p a005.class
p a005.clear

a006 = ["a", "b", "c"]
c006 = a006.clear
p c006.class
p c006
