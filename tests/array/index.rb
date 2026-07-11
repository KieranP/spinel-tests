# frozen_string_literal: true
# Array#index
p([1, 2, 3].index(2))

a001 = [1, 2, 3]
p a001.class
p a001.index(2)

a002 = [1, 2, 3]
b002 = 2
p b002.class
p a002.index(b002)

a003 = [1, 2, 3]
b003 = 2
c003 = a003.index(b003)
p c003.class
p c003

p(["a", "b", "c"].index("a"))

a007 = ["a", "b", "c"]
p a007.class
p a007.index("a")

a008 = ["a", "b", "c"]
b008 = "a"
p b008.class
p a008.index(b008)

a009 = ["a", "b", "c"]
b009 = "z"
c009 = a009.index(b009)
p c009.class
p c009

# Array#index matches Complex elements by value
p([Complex(1, 1), Complex(2, 2)].index(Complex(2, 2)))
a010 = [Complex(1, 1), Complex(2, 2)]
c010 = a010.index(Complex(2, 2))
p c010

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ai(oai)
  case oai
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_ai = (raisebr_ai("ab").index(5) rescue $!.class); p rb_ai

# strings differing only after an embedded NUL are distinct elements
p(["a\0b", "a\0c"].index("a\0c"))
a020ix = ["a\0b", "a\0c"]; v020ix = a020ix.index("a\0c"); p v020ix

# value form, block form and misses
h331 = [1, 2, 3, 2, 1]
p h331.index(2)
p h331.index(9)
p h331.index { |x332| x332 > 1 }
p h331.index { |x333| x333 > 9 }
w331 = h331.index(2); p w331
w332 = h331.index { |x334| x334 > 1 }; p w332
n333 = 3
p h331.index(n333)
p([].index(1))
p(%w[a b a].index("a"))
w334 = %w[a b a].index("a"); p w334
h335 = [[1], [2]]
p h335.index([2])

# a next carrying a value inside the predicate block
p([1, 2].index { |i640| next true if i640 == 1; false })
w640 = [1, 2].index { |i641| next true if i641 == 1; false }; p w640
