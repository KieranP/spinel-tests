# frozen_string_literal: true
# Array#take

p([1, 2, 3, 4].take(2))

a001 = [1, 2, 3, 4]
p a001.class
p a001.take(2)

a002 = [1, 2, 3, 4]
b002 = 2
p b002.class
p a002.take(b002)

a003 = [1, 2, 3, 4]
b003 = 2
c003 = a003.take(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].take(2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.take(2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.take(b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.take(b006)
p c006.class
p c006

p(["a", "b", "c", "d"].take(2))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.take(2)

a008 = ["a", "b", "c", "d"]
b008 = 2
p b008.class
p a008.take(b008)

a009 = ["a", "b", "c", "d"]
b009 = 2
c009 = a009.take(b009)
p c009.class
p c009

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_at(oat)
  case oat
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_at = (raisebr_at("ab").take(2) rescue $!.class); p rb_at

# Array#take on an Array read out of a container raises NoMethodError.
zk10 = [["a", "b", "c"]]
zk11 = (zk10[0].take(2) rescue $!.class); p zk11
# an Integer inner array is correct
zk12 = [[1, 2, 3]]; p zk12[0].take(2)

# at, past and below the length
h311 = [1, 2, 3, 4, 5]
p h311.take(2)
w311 = h311.take(2); p w311
p h311.take(0)
p h311.take(99)
n312 = 3
p h311.take(n312)
w312 = h311.take(n312); p w312
p([].take(2))
p(%w[a b c].take(2))
w313 = ([1, 2].take(-1) rescue $!.class); p w313

# a String index aborts the C build
r429 = ([1, 2].take("x") rescue $!.class); p r429
# a non-Integer index is absorbed instead of raising TypeError
r406 = ([1, 2].take(:s) rescue $!.class); p r406
