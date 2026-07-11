# frozen_string_literal: true
# Array#reverse
p([1, 2, 3].reverse)

a001 = [1, 2, 3]
p a001.class
p a001.reverse

a002 = [1, 2, 3]
c002 = a002.reverse
p c002.class
p c002

p([1.1, 2.2, 3.3].reverse)

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.reverse

a004 = [1.1, 2.2, 3.3]
c004 = a004.reverse
p c004.class
p c004

p(["a", "b", "c"].reverse)

a005 = ["a", "b", "c"]
p a005.class
p a005.reverse

a006 = ["a", "b", "c"]
c006 = a006.reverse
p c006.class
p c006

# empty receiver
p([].reverse)

a007 = []
c007 = a007.reverse
p c007

# single element
p([42].reverse)

a008 = [42]
c008 = a008.reverse
p c008

# reverse returns a new array; original is unchanged
a009 = [1, 2, 3]
b009 = a009.reverse
p a009
p b009

# nested arrays (outer order reversed, inner untouched)
p([[1, 2], [3, 4], [5, 6]].reverse)

a010 = [[1, 2], [3, 4], [5, 6]]
c010 = a010.reverse
p c010

p([[1, 2], [3, 4]].map(&:reverse))
a752 = [[1, 2], [3, 4]]; c752 = a752.map(&:reverse); p c752
