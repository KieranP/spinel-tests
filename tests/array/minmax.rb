# frozen_string_literal: true
# Array#minmax

p([3, 1, 2].minmax)

a001 = [3, 1, 2]
p a001.class
p a001.minmax

a002 = [3, 1, 2]
c002 = a002.minmax
p c002.class
p c002

p([3.5, 1.5, 2.5].minmax)

a003 = [3.5, 1.5, 2.5]
p a003.class
p a003.minmax

a004 = [3.5, 1.5, 2.5]
c004 = a004.minmax
p c004.class
p c004

p(["bbb", "a", "cc"].minmax)

a005 = ["bbb", "a", "cc"]
p a005.class
p a005.minmax

a006 = ["bbb", "a", "cc"]
c006 = a006.minmax
p c006.class
p c006
