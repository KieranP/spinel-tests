# frozen_string_literal: true
# Array#first

p([1, 2, 3].first(2))

a001 = [1, 2, 3]
p a001.class
p a001.first(2)

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.first(b002)

a003 = [1, 2, 3]
b003 = 2
c003 = a003.first(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].first(2))

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.first(2)

a005 = [1.1, 2.2, 3.3]
b005 = 2
p b005.class
p a005.first(b005)

a006 = [1.1, 2.2, 3.3]
b006 = 2
c006 = a006.first(b006)
p c006.class
p c006

p(["a", "b", "c"].first(2))

a007 = ["a", "b", "c"]
p a007.class
p a007.first(2)

a008 = ["a", "b", "c"]
b008 = 2
p b008.class
p a008.first(b008)

a009 = ["a", "b", "c"]
b009 = 2
c009 = a009.first(b009)
p c009.class
p c009

p([1, 2, 3].first)

a010 = [1, 2, 3]
c010 = a010.first
p c010.class
p c010

p([].first)

c011 = [].first
p c011

p([1, 2, 3].first(0))

a012 = [1, 2, 3]
c012 = a012.first(0)
p c012

p([1, 2].first(5))

a013 = [1, 2]
b013 = 5
c013 = a013.first(b013)
p c013

p([1, 2, 3].first(1))

a014 = [1, 2, 3]
c014 = a014.first(1)
p c014

# Array#first(n) on an Array read out of a container raises NoMethodError.
zf10 = [["a", "b", "c"]]
zf11 = (zf10[0].first(2) rescue $!.class); p zf11
# the no-arg form on the same receiver is correct
p zf10[0].first
# an Integer inner array is correct
zf12 = [[1, 2, 3]]; p zf12[0].first(2)

# the counted form, at and past the length, and on an empty receiver
h211 = [3, 1, 4, 1, 5]
p h211.first(3)
w211 = h211.first(3); p w211
p h211.first(0)
p h211.first(100)
n212 = 2
p h211.first(n212)
w212 = h211.first(n212); p w212
p([].first)
p([].first(2))
p(%w[a b c].first(2))
w213 = %w[a b c].first(2); p w213
w214 = ([1, 2].first(-1) rescue $!.class); p w214
h215 = [[1, 2], [3]]; p h215.first(1)

# a String index aborts the C build
r425 = ([1, 2].first("x") rescue $!.class); p r425
# a non-Integer index is absorbed instead of raising TypeError
r404 = ([1, 2].first(:s) rescue $!.class); p r404
