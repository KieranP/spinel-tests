# frozen_string_literal: true
# Array#replace

p([1, 2, 3].replace([4, 5]))

a001 = [1, 2, 3]
p a001.class
a001.replace([4, 5])
p a001

a002 = [1, 2, 3]
b002 = [4, 5]
p b002.class
a002.replace(b002)
p a002

a003 = [1, 2, 3]
b003 = [4, 5]
c003 = a003.replace(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].replace([4.4, 5.5]))

a004 = [1.1, 2.2, 3.3]
p a004.class
a004.replace([4.4, 5.5])
p a004

a005 = [1.1, 2.2, 3.3]
b005 = [4.4, 5.5]
p b005.class
a005.replace(b005)
p a005

a006 = [1.1, 2.2, 3.3]
b006 = [4.4, 5.5]
c006 = a006.replace(b006)
p c006.class
p c006

p(["a", "b", "c"].replace(["d", "e"]))

a007 = ["a", "b", "c"]
p a007.class
a007.replace(["d", "e"])
p a007

a008 = ["a", "b", "c"]
b008 = ["d", "e"]
p b008.class
a008.replace(b008)
p a008

a009 = ["a", "b", "c"]
b009 = ["d", "e"]
c009 = a009.replace(b009)
p c009.class
p c009
