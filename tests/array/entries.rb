# frozen_string_literal: true
# Array#entries

p([1, 2, 3].entries)

a001 = [1, 2, 3]
p a001.class
p a001.entries

a002 = [1, 2, 3]
c002 = a002.entries
p c002.class
p c002

p([1.1, 2.2, 3.3].entries)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.entries

a004 = [1.1, 2.2, 3.3]
c004 = a004.entries
p c004.class
p c004

p(["a", "b", "c"].entries)

a005 = ["a", "b", "c"]
p a005.class
p a005.entries

a006 = ["a", "b", "c"]
c006 = a006.entries
p c006.class
p c006

# empty receiver
p([].entries)
a007 = []
c007 = a007.entries
p c007
