# frozen_string_literal: true
# Array#flatten
p([1, [2, [3, [4]]]].flatten)

a001 = [1, [2, [3, [4]]]]
p a001.class
p a001.flatten

a002 = [1, [2, [3, [4]]]]
c002 = a002.flatten
p c002.class
p c002

p([1.1, [2.2, [3.3]]].flatten)

a003 = [1.1, [2.2, [3.3]]]
p a003.class
p a003.flatten

a004 = [1.1, [2.2, [3.3]]]
c004 = a004.flatten
p c004.class
p c004

p(["a", ["b", ["c"]]].flatten)

a005 = ["a", ["b", ["c"]]]
p a005.class
p a005.flatten

a006 = ["a", ["b", ["c"]]]
c006 = a006.flatten
p c006.class
p c006

p([1, [2, [3, [4]]]].flatten(1))

a007 = [1, [2, [3, [4]]]]
p a007.class
p a007.flatten(1)

a008 = [1, [2, [3, [4]]]]
b008 = 1
p b008.class
p a008.flatten(b008)

a009 = [1, [2, [3, [4]]]]
b009 = 1
c009 = a009.flatten(b009)
p c009.class
p c009

# flatten(0): no-op copy
p([1, [2, [3]]].flatten(0))

a010 = [1, [2, [3]]]
c010 = a010.flatten(0)
p c010

# negative depth: fully flattens
p([1, [2, [3, [4]]]].flatten(-1))

a011 = [1, [2, [3, [4]]]]
c011 = a011.flatten(-1)
p c011

# already-flat array
p([1, 2, 3].flatten)

a012 = [1, 2, 3]
c012 = a012.flatten
p c012

# empty receiver
p([].flatten)

a013 = []
c013 = a013.flatten
p c013

# array with nil elements
p([1, [nil, [2]], nil].flatten)

a014 = [1, [nil, [2]], nil]
c014 = a014.flatten
p c014

# deeply nested
p([[[[[1]]]], [[2]]].flatten)

a015 = [[[[[1]]]], [[2]]]
c015 = a015.flatten
p c015

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_af(oaf)
  case oaf
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_af = (raisebr_af("ab").flatten rescue $!.class); p rb_af

# `flatten` on an Array reached through an enclosing container raises NoMethodError.
hf01 = { 0 => [1, nil, 2] }; hg01 = (hf01[0].flatten rescue $!.class); p hg01
hf02 = [[1, nil, 2]]; hg02 = (hf02[0].flatten rescue $!.class); p hg02

# every depth, including 0, a depth past the nesting, and a negative depth
h091 = [1, [2, [3, [4, [5]]]]]
p h091.flatten
p h091.flatten(0)
p h091.flatten(1)
p h091.flatten(2)
p h091.flatten(3)
p h091.flatten(10)
p h091.flatten(-1)
w091 = h091.flatten(1); p w091
w092 = h091.flatten(2); p w092
n093 = 2
p h091.flatten(n093)
w093 = h091.flatten(n093); p w093
p([[], [[]], [[[]]]].flatten)
p([[], [[]], [[[]]]].flatten(1))
p([].flatten)
p([[["a"], ["b"]]].flatten)
w094 = [[["a"], ["b"]]].flatten(1); p w094
