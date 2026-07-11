# frozen_string_literal: true
# Array#&

p([1, 2, 3] & [2, 3, 4])

a001 = [1, 2, 3]
p a001.class
p(a001 & [2, 3, 4])

a002 = [1, 2, 3]
b002 = [2, 3, 4]
p b002.class
p(a002 & b002)

a003 = [1, 2, 3]
b003 = [2, 3, 4]
c003 = (a003 & b003)
p c003.class
p c003

p([1.1, 2.2, 3.3] & [2.2, 3.3, 4.4])

a004 = [1.1, 2.2, 3.3]
p a004.class
p(a004 & [2.2, 3.3, 4.4])

a005 = [1.1, 2.2, 3.3]
b005 = [2.2, 3.3, 4.4]
p b005.class
p(a005 & b005)

a006 = [1.1, 2.2, 3.3]
b006 = [2.2, 3.3, 4.4]
c006 = (a006 & b006)
p c006.class
p c006

p(["a", "b", "c"] & ["b", "c", "d"])

a007 = ["a", "b", "c"]
p a007.class
p(a007 & ["b", "c", "d"])

a008 = ["a", "b", "c"]
b008 = ["b", "c", "d"]
p b008.class
p(a008 & b008)

a009 = ["a", "b", "c"]
b009 = ["b", "c", "d"]
c009 = (a009 & b009)
p c009.class
p c009

# strings differing only after an embedded NUL are distinct elements
p((["a\0b", "a\0c"] & ["a\0c"]).map(&:bytes))
a010am = ["a\0b", "a\0c"]; b010am = ["a\0c"]; v010am = (a010am & b010am).map(&:bytes); p v010am
