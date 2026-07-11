# frozen_string_literal: true
# Array#max
p([3, 1, 2].max(2))

a001 = [3, 1, 2]
p a001.class
p a001.max(2)

a002 = [3, 1, 2]
b002 = 2
p b002.class
p a002.max(b002)

a003 = [3, 1, 2]
b003 = 2
c003 = a003.max(b003)
p c003.class
p c003

p([3.3, 1.1, 2.2].max(2))

a004 = [3.3, 1.1, 2.2]
p a004.class
p a004.max(2)

a005 = [3.3, 1.1, 2.2]
b005 = 2
p b005.class
p a005.max(b005)

a006 = [3.3, 1.1, 2.2]
b006 = 2
c006 = a006.max(b006)
p c006.class
p c006

p(["c", "a", "b"].max(2))

a007 = ["c", "a", "b"]
p a007.class
p a007.max(2)

a008 = ["c", "a", "b"]
b008 = 2
p b008.class
p a008.max(b008)

a009 = ["c", "a", "b"]
b009 = 2
c009 = a009.max(b009)
p c009.class
p c009

p([1, 2, 3, 4].max(2) { |x, y| x <=> y })

a010 = [1, 2, 3, 4]
c010 = a010.max(2) { |x, y| x <=> y }
p c010.class
p c010

# no-arg form returns a single element (not an array)
p([3, 1, 2].max)
a011 = [3, 1, 2]
c011 = a011.max
p c011.class
p c011

p([3.3, 1.1, 2.2].max)
a012 = [3.3, 1.1, 2.2]
c012 = a012.max
p c012

p(["c", "a", "b"].max)
a013 = ["c", "a", "b"]
c013 = a013.max
p c013

# block comparator with no count arg -> single element
p([1, 2, 3].max { |a, b| b <=> a })
a014 = [1, 2, 3]
c014 = a014.max { |x, y| y <=> x }
p c014

# empty array: no-arg -> nil, with count -> []
p([].max)
a015 = []
c015 = a015.max
p c015

p([].max(2))
a016 = []
c016 = a016.max(2)
p c016

# max(0) -> []
p([3, 1, 2].max(0))
a017 = [3, 1, 2]
c017 = a017.max(0)
p c017

# Array#max on an Array read out of a container returns nil.
zx01 = [["a", "b", "c"]]
p zx01[0].max
zy01 = zx01[0].max; p zy01
zz01 = { "row" => ["x", "y", "z"] }
p zz01["row"].max
# an Integer inner array is correct
zw01 = [[3, 1, 2]]; p zw01[0].max

# embedded NUL: max compares the bytes after the NUL too
p(["a\0b", "a\0c"].max.bytes)
a900mx = ["a\0b", "a\0c"]; v900mx = a900mx.max.bytes; p v900mx

# the counted form, a comparison block, and empty receivers
h121 = [3, 1, 4, 1, 5, 9, 2, 6]
p h121.max(3)
w121 = h121.max(3); p w121
p h121.max(0)
p h121.max(100)
p h121.max { |x122, y122| y122 <=> x122 }
w122 = h121.max(2) { |x123, y123| y123 <=> x123 }; p w122
n124 = 3
p h121.max(n124)
p([].max)
p([].max(2))
p([7].max(1))
p(%w[pear fig apple].max)
w125 = %w[pear fig apple].max(2); p w125

# empty receiver: a literal with the result assigned, and a drained Float array
f260 = [].max; p f260
f261 = [1.5]; f261.pop; p f261.max

def max601(items) = items.max { |a, b| a <=> b }
p max601([3, 1, 2])
w603 = max601(%w[pear fig apple]); p w603
