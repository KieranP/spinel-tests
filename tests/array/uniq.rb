# frozen_string_literal: true
# Array#uniq

p([1, 1, 2, 3, 3].uniq)

a001 = [1, 1, 2, 3, 3]
p a001.class
p a001.uniq

a002 = [1, 1, 2, 3, 3]
b002 = a002.uniq
p b002.class
p b002

p(["a", "a", "b", "c", "c"].uniq)

a005 = ["a", "a", "b", "c", "c"]
p a005.class
p a005.uniq

a006 = ["a", "a", "b", "c", "c"]
b006 = a006.uniq
p b006.class
p b006

# block form
p([1, 2, 3, 4].uniq { |x| x % 2 })

a007 = [1, 2, 3, 4]
b007 = a007.uniq { |x| x % 2 }
p b007.class
p b007

# float duplicates (blockless)
p([1.1, 1.1, 2.2].uniq)
a008 = [1.1, 1.1, 2.2]
b008 = a008.uniq
p b008.class
p b008

# preserves first-occurrence order
p([3, 1, 3, 2, 1].uniq)

a009 = [3, 1, 3, 2, 1]
b009 = a009.uniq
p b009.class
p b009

# all-unique
p([1, 2, 3].uniq)

a010 = [1, 2, 3]
b010 = a010.uniq
p b010

# all-same
p([5, 5, 5].uniq)

a011 = [5, 5, 5]
b011 = a011.uniq
p b011

# empty receiver
p([].uniq)

a012 = []
b012 = a012.uniq
p b012

# Array#uniq dedupes equal Complex elements
p([Complex(1, 1), Complex(1, 1), Complex(2, 2)].uniq)
a013 = [Complex(1, 1), Complex(1, 1), Complex(2, 2)]
b013 = a013.uniq
p b013

# strings differing only after an embedded NUL are distinct elements
p(["a\0b", "a\0c"].uniq.size)
a014uq = ["a\0b", "a\0c"]; v014uq = a014uq.uniq.size; p v014uq

# the block form keys on the block's value
h351 = [1, 2, 3, 4]
p h351.uniq { |x352| x352 % 2 }
w351 = h351.uniq { |x353| x353 % 2 }; p w351
p(%w[a AB b].uniq { |s354| s354.length })
w354 = %w[a AB b].uniq { |s355| s355.length }; p w354
p([1, 2, 2, 3].uniq)
p([].uniq { |x356| x356 })
h357 = [[1, 2], [1, 3], [2, 4]]
p h357.uniq { |r357| r357.first }
w357 = h357.uniq { |r358| r358.first }; p w357
