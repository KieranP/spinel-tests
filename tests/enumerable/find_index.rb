# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#find_index
p(Nums.new(3, 1, 2).find_index(2))

a001 = n
p a001.class
p a001.find_index(2)

a002 = Nums.new(3, 1, 2)
b002 = 2
p b002.class
p a002.find_index(b002)

a003 = Nums.new(3, 1, 2)
b003 = 2
c003 = a003.find_index(b003)
p c003.class
p c003

p(Nums.new(1.5, 2.5, 3.5).find_index(2.5))

a004 = Nums.new(1.5, 2.5, 3.5)
p a004.class
p a004.find_index(2.5)

a005 = Nums.new(1.5, 2.5, 3.5)
b005 = 2.5
p b005.class
p a005.find_index(b005)

a006 = Nums.new(1.5, 2.5, 3.5)
b006 = 2.5
c006 = a006.find_index(b006)
p c006.class
p c006

p(Nums.new("a", "b", "c").find_index("b"))

a007 = Nums.new("a", "b", "c")
p a007.class
p a007.find_index("b")

a008 = Nums.new("a", "b", "c")
b008 = "b"
p b008.class
p a008.find_index(b008)

a009 = Nums.new("a", "b", "c")
b009 = "b"
c009 = a009.find_index(b009)
p c009.class
p c009

p(Nums.new(3, 1, 2).find_index { |x| x == 1 })

a010 = Nums.new(3, 1, 2)
p a010.class
p a010.find_index { |x| x == 1 }

a011 = Nums.new(3, 1, 2)
c011 = a011.find_index { |x| x == 1 }
p c011.class
p c011

# Blockless Enumerable#find_index on a user class returns an Enumerator; Spinel stops the
# build with `unsupported call`, so this is kept commented.
r401fi = (Nums.new(1, 2, 3).find_index.class rescue $!.class); p r401fi
