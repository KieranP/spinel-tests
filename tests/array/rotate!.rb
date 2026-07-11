# frozen_string_literal: true
# Array#rotate!
p([1, 2, 3, 4].rotate!(1))

a001 = [1, 2, 3, 4]
p a001.class
p a001.rotate!(1)

a002 = [1, 2, 3, 4]
b002 = 1
p b002.class
p a002.rotate!(b002)

a003 = [1, 2, 3, 4]
b003 = 1
c003 = a003.rotate!(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].rotate!(2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.rotate!(2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.rotate!(b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.rotate!(b006)
p c006.class
p c006

p(["a", "b", "c", "d"].rotate!(-1))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.rotate!(-1)

a008 = ["a", "b", "c", "d"]
b008 = -1
p b008.class
p a008.rotate!(b008)

a009 = ["a", "b", "c", "d"]
b009 = -1
c009 = a009.rotate!(b009)
p c009.class
p c009
