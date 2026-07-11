# frozen_string_literal: true
# Array#drop

p([1, 2, 3, 4].drop(2))

a001 = [1, 2, 3, 4]
p a001.class
p a001.drop(2)

a002 = [1, 2, 3, 4]
b002 = 2
p b002.class
p a002.drop(b002)

a003 = [1, 2, 3, 4]
b003 = 2
c003 = a003.drop(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].drop(2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.drop(2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.drop(b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.drop(b006)
p c006.class
p c006

p(["a", "b", "c", "d"].drop(2))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.drop(2)

a008 = ["a", "b", "c", "d"]
b008 = 2
p b008.class
p a008.drop(b008)

a009 = ["a", "b", "c", "d"]
b009 = 2
c009 = a009.drop(b009)
p c009.class
p c009

# Array#drop on an Array read out of a container raises NoMethodError.
zd10 = [["a", "b", "c"]]
zd11 = (zd10[0].drop(1) rescue $!.class); p zd11
# an Integer inner array is correct
zd12 = [[1, 2, 3]]; p zd12[0].drop(1)

# at, past and below the length
h321 = [1, 2, 3, 4, 5]
p h321.drop(2)
w321 = h321.drop(2); p w321
p h321.drop(0)
p h321.drop(99)
n322 = 3
p h321.drop(n322)
w322 = h321.drop(n322); p w322
p([].drop(2))
p(%w[a b c].drop(2))
w323 = ([1, 2].drop(-1) rescue $!.class); p w323

# a String index aborts the C build
r423 = ([1, 2].drop("x") rescue $!.class); p r423
# a non-Integer index is absorbed instead of raising TypeError
r407 = ([1, 2].drop(:s) rescue $!.class); p r407
