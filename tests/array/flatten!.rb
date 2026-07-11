# frozen_string_literal: true
# Array#flatten!
p([1, [2, [3]]].flatten!)

a001 = [1, [2, [3]]]
p a001.class
a001.flatten!
p a001

a002 = [1, [2, [3]]]
c002 = a002.flatten!
p c002.class
p c002

p([1.1, [2.2, [3.3]]].flatten!)

a003 = [1.1, [2.2, [3.3]]]
p a003.class
a003.flatten!
p a003

a004 = [1.1, [2.2, [3.3]]]
c004 = a004.flatten!
p c004.class
p c004

p(["a", ["b", ["c"]]].flatten!)

a005 = ["a", ["b", ["c"]]]
p a005.class
a005.flatten!
p a005

a006 = ["a", ["b", ["c"]]]
c006 = a006.flatten!
p c006.class
p c006

p([1, [2, [3, [4]]]].flatten!(1))

a007 = [1, [2, [3, [4]]]]
p a007.class
a007.flatten!(1)
p a007

a008 = [1, [2, [3, [4]]]]
b008 = 1
p b008.class
a008.flatten!(b008)
p a008

a009 = [1, [2, [3, [4]]]]
b009 = 1
c009 = a009.flatten!(b009)
p c009.class
p c009

# no-change (already flat) returns nil
p([1, 2, 3].flatten!)
a010 = [1, 2, 3]; c010 = a010.flatten!; p c010

# depth argument, and the nil answer when nothing changes
h101 = [[1, 2], [3, 4]]; p h101.flatten!(1); p h101
h102 = [1, [2, [3]]]; p h102.flatten!(1); p h102
h103 = [1, 2, 3]; p h103.flatten!
w103 = [1, 2, 3].flatten!; p w103
h104 = [1, [2, [3]]]; w104 = h104.flatten!; p w104
h105 = [[["a"]]]; h105.flatten!; p h105
