# frozen_string_literal: true
# Array#reverse!
p([1, 2, 3].reverse!)

a001 = [1, 2, 3]
p a001.class
a001.reverse!
p a001

a002 = [1, 2, 3]
c002 = a002.reverse!
p c002.class
p c002

p([1.1, 2.2, 3.3].reverse!)

a003 = [1.1, 2.2, 3.3]
p a003.class
a003.reverse!
p a003

a004 = [1.1, 2.2, 3.3]
c004 = a004.reverse!
p c004.class
p c004

p(["a", "b", "c"].reverse!)

a005 = ["a", "b", "c"]
p a005.class
a005.reverse!
p a005

a006 = ["a", "b", "c"]
c006 = a006.reverse!
p c006.class
p c006

# single element
p([42].reverse!)

a007 = [42]
a007.reverse!
p a007

# reverse! returns self (same object)
a008 = [1, 2, 3]
b008 = a008.reverse!
p a008.equal?(b008)

# nested arrays (outer order reversed, inner untouched)
p([[1, 2], [3, 4], [5, 6]].reverse!)

a009 = [[1, 2], [3, 4], [5, 6]]
a009.reverse!
p a009
