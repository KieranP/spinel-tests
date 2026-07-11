# frozen_string_literal: true
# Array#compact!
p([1, nil, 2, nil, 3].compact!)

a001 = [1, nil, 2, nil, 3]
p a001.class
a001.compact!
p a001

a002 = [1, nil, 2, nil, 3]
c002 = a002.compact!
p c002.class
p c002

p([1.1, nil, 2.2, nil].compact!)

a003 = [1.1, nil, 2.2, nil]
p a003.class
a003.compact!
p a003

a004 = [1.1, nil, 2.2, nil]
c004 = a004.compact!
p c004.class
p c004

p(["a", nil, "b", nil].compact!)

a005 = ["a", nil, "b", nil]
p a005.class
a005.compact!
p a005

a006 = ["a", nil, "b", nil]
c006 = a006.compact!
p c006.class
p c006

# no-change (no nils) returns nil
p([1, 2, 3].compact!)
a007 = [1, 2, 3]; c007 = a007.compact!; p c007
