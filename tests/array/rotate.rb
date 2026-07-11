# frozen_string_literal: true
# Array#rotate
p([1, 2, 3, 4].rotate(1))

a001 = [1, 2, 3, 4]
p a001.class
p a001.rotate(1)

a002 = [1, 2, 3, 4]
b002 = 1
p b002.class
p a002.rotate(b002)

a003 = [1, 2, 3, 4]
b003 = 1
c003 = a003.rotate(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].rotate(2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.rotate(2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.rotate(b005)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.rotate(b006)
p c006.class
p c006

p(["a", "b", "c", "d"].rotate(-1))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.rotate(-1)

a008 = ["a", "b", "c", "d"]
b008 = -1
p b008.class
p a008.rotate(b008)

a009 = ["a", "b", "c", "d"]
b009 = -1
c009 = a009.rotate(b009)
p c009.class
p c009

# rotate beyond size wraps
p([1, 2, 3, 4].rotate(10))
a020 = [1, 2, 3, 4]
c020 = a020.rotate(10)
p c020

# rotate(0) -> copy
p([1, 2, 3].rotate(0))
a021 = [1, 2, 3]
c021 = a021.rotate(0)
p c021

# large negative wraps
p([1, 2, 3, 4].rotate(-6))
a022 = [1, 2, 3, 4]
c022 = a022.rotate(-6)
p c022

# empty receiver
p([].rotate(3))
a023 = []
c023 = a023.rotate(3)
p c023

# single element
p([9].rotate(2))
a024 = [9]
c024 = a024.rotate(2)
p c024

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ao(oao)
  case oao
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_ao = (raisebr_ao("ab").rotate rescue $!.class); p rb_ao

# Array#rotate on an Array read out of a container raises NoMethodError.
zr10 = [["a", "b", "c"]]
zr11 = (zr10[0].rotate rescue $!.class); p zr11
# an Integer inner array is correct
zr12 = [[1, 2, 3]]; p zr12[0].rotate

# every rotation count, including counts beyond the length
g951 = [1, 2, 3, 4, 5]
p g951.rotate
p g951.rotate(2)
p g951.rotate(-2)
p g951.rotate(0)
p g951.rotate(7)
p g951.rotate(-7)
v951 = g951.rotate(2); p v951
v952 = g951.rotate(-2); p v952
n953 = 3
p g951.rotate(n953)
v953 = g951.rotate(n953); p v953
p([].rotate(3))
p([7].rotate(2))
p(%w[a b c].rotate(1))
v954 = %w[a b c].rotate(-1); p v954
g955 = ([1, 2].rotate("a") rescue $!.class); p g955

# a non-Integer index is absorbed instead of raising TypeError
r410 = ([1, 2].rotate(nil) rescue $!.class); p r410
