# frozen_string_literal: true
# Array#rindex
p([1, 2, 3, 2, 1].rindex(2))

a001 = [1, 2, 3, 2, 1]
p a001.class
p a001.rindex(2)

a002 = [1, 2, 3, 2, 1]
b002 = 2
p b002.class
p a002.rindex(b002)

a003 = [1, 2, 3, 2, 1]
b003 = 2
c003 = a003.rindex(b003)
p c003.class
p c003

p([:a, :b, :c, :b, :a].rindex(:b))

a004 = [:a, :b, :c, :b, :a]
p a004.class
p a004.rindex(:b)

a005 = [:a, :b, :c, :b, :a]
b005 = :b
p b005.class
p a005.rindex(b005)

a006 = [:a, :b, :c, :b, :a]
b006 = :b
c006 = a006.rindex(b006)
p c006.class
p c006

p(["a", "b", "c", "b", "a"].rindex("b"))

a007 = ["a", "b", "c", "b", "a"]
p a007.class
p a007.rindex("b")

a008 = ["a", "b", "c", "b", "a"]
b008 = "b"
p b008.class
p a008.rindex(b008)

a009 = ["a", "b", "c", "b", "a"]
b009 = "b"
c009 = a009.rindex(b009)
p c009.class
p c009

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ar(oar)
  case oar
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_ar = (raisebr_ar("ab").rindex(5) rescue $!.class); p rb_ar

# value form, block form and misses
h341 = [1, 2, 3, 2, 1]
p h341.rindex(2)
p h341.rindex(9)
p h341.rindex { |x342| x342 > 1 }
p h341.rindex { |x343| x343 > 9 }
w341 = h341.rindex(2); p w341
w342 = h341.rindex { |x344| x344 > 1 }; p w342
n343 = 1
p h341.rindex(n343)
p([].rindex(1))
p(%w[a b a].rindex("a"))
w344 = %w[a b a].rindex("a"); p w344
