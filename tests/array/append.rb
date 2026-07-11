# frozen_string_literal: true
# Array#append

p([1, 2].append(3))

a001 = [1, 2]
p a001.class
a001.append(3)
p a001

a002 = [1, 2]
b002 = 3
p b002.class
a002.append(b002)
p a002

a003 = [1, 2]
b003 = 3
c003 = a003.append(b003)
p c003.class
p c003

p([1.1, 2.2].append(3.3))

a004 = [1.1, 2.2]
p a004.class
a004.append(3.3)
p a004

a005 = [1.1, 2.2]
b005 = 3.3
p b005.class
a005.append(b005)
p a005

a006 = [1.1, 2.2]
b006 = 3.3
c006 = a006.append(b006)
p c006.class
p c006

p(["a", "b"].append("c"))

a007 = ["a", "b"]
p a007.class
a007.append("c")
p a007

a008 = ["a", "b"]
b008 = "c"
p b008.class
a008.append(b008)
p a008

a009 = ["a", "b"]
b009 = "c"
c009 = a009.append(b009)
p c009.class
p c009

p([1, 2].append(3, 4, 5))

a010 = [1, 2]
a010.append(3, 4, 5)
p a010

p([1, 2].append(nil))

a011 = [1, 2]
a011.append(nil)
p a011

p([1, 2].append([3, 4]))

a012 = [1, 2]
a012.append([3, 4])
p a012

p([].append(1))
r013 = ([].append(1, 2) rescue "err")
p r013
# zero arguments is a no-op returning the receiver
a021 = [1, 2]; p a021.append; p a021
p([1, 2].append)

# #append inside a lambda whose argument is an empty Array
ag01 = ->(acc01) { acc01.append(1) }
ae01 = []
p ag01.call(ae01)
# BUG 20260904191646791 - capturing the result of a lambda mutating an empty Array argument aborts the C build
# aw01 = ag01.call(ae01); p aw01
