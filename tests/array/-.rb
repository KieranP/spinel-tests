# frozen_string_literal: true
# Array#-

p([1, 2, 3] - [2])

a001 = [1, 2, 3]
p a001.class
p(a001 - [2])

a002 = [1, 2, 3]
b002 = [2]
p b002.class
p(a002 - b002)

a003 = [1, 2, 3]
b003 = [2]
c003 = (a003 - b003)
p c003.class
p c003

p([1.1, 2.2, 3.3] - [2.2])

a004 = [1.1, 2.2, 3.3]
p a004.class
p(a004 - [2.2])

a005 = [1.1, 2.2, 3.3]
b005 = [2.2]
p b005.class
p(a005 - b005)

a006 = [1.1, 2.2, 3.3]
b006 = [2.2]
c006 = (a006 - b006)
p c006.class
p c006

p(["a", "b", "c"] - ["b"])

a007 = ["a", "b", "c"]
p a007.class
p(a007 - ["b"])

a008 = ["a", "b", "c"]
b008 = ["b"]
p b008.class
p(a008 - b008)

a009 = ["a", "b", "c"]
b009 = ["b"]
c009 = (a009 - b009)
p c009.class
p c009

# element not present
p([1, 2, 3] - [9])
a010 = [1, 2, 3] - [9]; p a010

# remove all elements
p([1, 2, 3] - [1, 2, 3])
a011 = [1, 2, 3] - [1, 2, 3]; p a011

# removes ALL matching occurrences
p([1, 1, 2] - [1])
a012 = [1, 1, 2] - [1]; p a012

# empty subtrahend
p([1, 2] - [])
a013 = [1, 2] - []; p a013

# empty array literal minuend
p([] - [1])
a016 = [] - [1]; p a016

# mixed types
p([1, "a", 2] - ["a"])
a014 = [1, "a", 2] - ["a"]; p a014

# nested-array elements
p([[1, 2], [3, 4]] - [[1, 2]])
a015 = [[1, 2], [3, 4]] - [[1, 2]]; p a015

# strings differing only after an embedded NUL are distinct elements
p((["a\0b", "a\0c"] - ["a\0b"]).map(&:bytes))
a016mn = ["a\0b", "a\0c"]; b016mn = ["a\0b"]; v016mn = (a016mn - b016mn).map(&:bytes); p v016mn
