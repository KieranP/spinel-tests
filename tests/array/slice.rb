# frozen_string_literal: true
# Array#slice
p([10, 20, 30, 40].slice(1))

a001 = [10, 20, 30, 40]
p a001.class
p a001.slice(1)

a002 = [10, 20, 30, 40]
b002 = 1
p b002.class
p a002.slice(b002)

a003 = [10, 20, 30, 40]
b003 = 1
c003 = a003.slice(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].slice(2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.slice(2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.slice(b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.slice(b006)
p c006.class
p c006

p(["a", "b", "c", "d"].slice(0))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.slice(0)

a008 = ["a", "b", "c", "d"]
b008 = 0
p b008.class
p a008.slice(b008)

a009 = ["a", "b", "c", "d"]
b009 = 0
c009 = a009.slice(b009)
p c009.class
p c009

p([10, 20, 30, 40].slice(1..3))

a010 = [10, 20, 30, 40]
p a010.class
p a010.slice(1..3)

a011 = [10, 20, 30, 40]
b011 = 1..3
p b011.class
p a011.slice(b011)

a012 = [10, 20, 30, 40]
b012 = 1..3
c012 = a012.slice(b012)
p c012.class
p c012

p([1, 2, 3, 4, 5].slice(10, 2))
v097 = [1, 2, 3, 4, 5].slice(10, 2); p v097

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_as(oas)
  case oas
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_as = (raisebr_as("ab").slice(0, 2) rescue $!.class); p rb_as

# An Array read out of a container: slice(Range) degrades to element 0.
zs01 = [["a", "b", "c"]]; zt01 = zs01[0]
p zt01.slice(0..1)
zu01 = zt01.slice(1..2); p zu01
# the (start, length) form on the same receiver is correct
p zt01.slice(0, 2)
zv01 = zt01.slice(0, 2); p zv01

# A two-element splat keeps only the first argument, so the 1-arg overload runs:
# Ruby [1, 2], Spinel 1.
k096 = [0, 2]
p([1, 2, 3].slice(*k096))
v096 = [1, 2, 3].slice(*k096); p v096
# control: the same arguments spread positionally
p([1, 2, 3].slice(0, 2))

# (start, length) and Range forms, out of range and negative
h301 = [1, 2, 3, 4, 5]
p h301.slice(1, 2)
w301 = h301.slice(1, 2); p w301
p h301.slice(1..3)
p h301.slice(1...3)
p h301.slice(-2, 2)
p h301.slice(-2..)
p h301.slice(..2)
p h301.slice(5, 1)
p h301.slice(6, 1)
p h301.slice(2)
p h301.slice(-1)
p h301.slice(9)
w302 = h301.slice(1..3); p w302
w303 = h301.slice(6, 1); p w303
w304 = h301.slice(-2, 2); p w304
p([].slice(0, 1))
p(%w[a b c].slice(1, 2))
w305 = %w[a b c].slice(1..); p w305

# a String index aborts the C build
r428 = ([1, 2].slice("x") rescue $!.class); p r428
# a non-Integer index is absorbed instead of raising TypeError
r408 = ([1, 2].slice(:s) rescue $!.class); p r408
