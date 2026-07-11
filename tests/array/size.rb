# frozen_string_literal: true
# Array#size
p([1, 2, 3].size)

a001 = [1, 2, 3]
p a001.class
p a001.size

a002 = [1, 2, 3]
c002 = a002.size
p c002.class
p c002

p([1.1, 2.2].size)

a003 = [1.1, 2.2]
p a003.class
p a003.size

a004 = [1.1, 2.2]
c004 = a004.size
p c004.class
p c004

p(["a", "b", "c", "d"].size)

a005 = ["a", "b", "c", "d"]
p a005.class
p a005.size

a006 = ["a", "b", "c", "d"]
c006 = a006.size
p c006.class
p c006

p([].size)

a007 = []
p a007.class
p a007.size

# nested arrays: size counts the outer elements only
p([[1, 2], [3, 4], [5, 6]].size)

a008 = [[1], [2], [3]]
p a008.class
p a008.size

a009 = [[1, 2], [3, 4]]
c009 = a009.size
p c009.class
p c009
