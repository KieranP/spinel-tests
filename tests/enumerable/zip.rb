# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#zip
p(Nums.new(3, 1, 2).zip([4, 5, 6]))

a001 = n
p a001.class
p a001.zip([4, 5, 6])

a002 = Nums.new(3, 1, 2)
b002 = [4, 5, 6]
p b002.class
p a002.zip(b002)

a003 = Nums.new(3, 1, 2)
b003 = [4, 5, 6]
c003 = a003.zip(b003)
p c003.class
p c003

# Enumerable#zip with multiple arguments and uneven lengths
p(Nums.new(3, 1, 2).zip([4, 5, 6], [7, 8, 9]))
p(Nums.new(3, 1, 2).zip([4, 5]))

p(Nums.new(1.5, 2.5, 3.5).zip([4.5, 5.5, 6.5]))

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.zip([4.5, 5.5, 6.5])
p c004.class
p c004

p(Nums.new("a", "b", "c").zip(["x", "y", "z"]))

a005 = Nums.new("a", "b", "c")
c005 = a005.zip(["x", "y", "z"])
p c005.class
p c005

# Enumerable#zip with a block (yields each row, returns nil)
Nums.new(3, 1, 2).zip([4, 5, 6]) { |row| p row }

a006 = Nums.new(3, 1, 2)
c006 = a006.zip([4, 5, 6]) { |row| p row }
p c006.class
p c006

# Enumerable#zip with a user Enumerable ARGUMENT. Compiles with an incompatible-pointer
# warning and segfaults the binary, taking the whole file's output with it, so it is kept
# commented.
p(Nums.new(1, 2).zip(Nums.new(3, 4)))
c401 = Nums.new(1, 2).zip(Nums.new(3, 4)); p c401

# A Range or a second Array in the same argument position works.
p(Nums.new(3, 1, 2).zip(1..3))
c402 = Nums.new(3, 1, 2).zip(1..3); p c402
