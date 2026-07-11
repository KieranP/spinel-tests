# frozen_string_literal: true
# Array#<<

p([1, 2] << 3)

a001 = [1, 2]
p a001.class
a001 << 3
p a001

a002 = [1, 2]
b002 = 3
p b002.class
a002 << b002
p a002

a003 = [1, 2]
b003 = 3
c003 = (a003 << b003)
p c003.class
p c003

p([1.1, 2.2] << 3.3)

a004 = [1.1, 2.2]
p a004.class
a004 << 3.3
p a004

a005 = [1.1, 2.2]
b005 = 3.3
p b005.class
a005 << b005
p a005

a006 = [1.1, 2.2]
b006 = 3.3
c006 = (a006 << b006)
p c006.class
p c006

p(["a", "b"] << "c")

a007 = ["a", "b"]
p a007.class
a007 << "c"
p a007

a008 = ["a", "b"]
b008 = "c"
p b008.class
a008 << b008
p a008

a009 = ["a", "b"]
b009 = "c"
c009 = (a009 << b009)
p c009.class
p c009

# chained <<
p([1, 2] << 3 << 4)
a010 = [1, 2]
a010 << 3 << 4
p a010

# << an array appends it as one element
p([1] << [2, 3])
a011 = [1]
a011 << [2, 3]
p a011

# << nil
p([1] << nil)
a012 = [1]
a012 << nil
p a012

# capturing the return of a << that widens the element type gives the capture
# the pre-widening type
# Kept commented: only a compile *warning*, but the local then prints raw memory.
la96 = [1, 2]; lc96 = (la96 << :x); p lc96
# control: no capture, and an already-polymorphic receiver
la97 = [1, 2]; la97 << :x; p la97
lb97 = [1, :y]; lc97 = (lb97 << :x); p lc97
