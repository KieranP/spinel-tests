# frozen_string_literal: true
# Array#delete_at
p([1, 2, 3].delete_at(1))

a001 = [1, 2, 3]
p a001.class
a001.delete_at(1)
p a001

a002 = [1, 2, 3]
b002 = 1
p b002.class
a002.delete_at(b002)
p a002

a003 = [1, 2, 3]
b003 = 1
c003 = a003.delete_at(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].delete_at(1))

a004 = [1.1, 2.2, 3.3]
p a004.class
a004.delete_at(1)
p a004

a005 = [1.1, 2.2, 3.3]
b005 = 1
p b005.class
a005.delete_at(b005)
p a005

a006 = [1.1, 2.2, 3.3]
b006 = 1
c006 = a006.delete_at(b006)
p c006.class
p c006

p(["a", "b", "c"].delete_at(1))

a007 = ["a", "b", "c"]
p a007.class
a007.delete_at(1)
p a007

a008 = ["a", "b", "c"]
b008 = 1
p b008.class
a008.delete_at(b008)
p a008

a009 = ["a", "b", "c"]
b009 = 1
c009 = a009.delete_at(b009)
p c009.class
p c009

# negative and out-of-range indices
h531 = [1, 2, 3]
p h531.dup.delete_at(1)
w531 = [1, 2, 3].delete_at(1); p w531
h532 = [1, 2, 3]; h532.delete_at(-1); p h532
p([1, 2, 3].delete_at(9))
p([1, 2, 3].delete_at(-9))
w533 = [1, 2, 3].delete_at(9); p w533
p([].delete_at(0))
n534 = 0
h534 = %w[a b c]; p h534.delete_at(n534); p h534
