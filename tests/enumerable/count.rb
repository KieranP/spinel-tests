# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#count
p(Nums.new(3, 1, 2).count)

p n.class
p n.count

a001 = Nums.new(3, 1, 2)
c001 = a001.count
p c001.class
p c001

p(Nums.new(3, 1, 2).count(1))

a002 = Nums.new(3, 1, 2)
b002 = 1
p b002.class
p a002.count(b002)

a003 = Nums.new(3, 1, 2)
b003 = 1
c003 = a003.count(b003)
p c003.class
p c003

p(Nums.new(3, 1, 2).count { |x| x > 1 })

a004 = Nums.new(3, 1, 2)
c004 = a004.count { |x| x > 1 }
p c004.class
p c004

p(Nums.new(3.5, 1.5, 2.5).count)

a005 = Nums.new(3.5, 1.5, 2.5)
p a005.class
p a005.count

p(Nums.new(3.5, 1.5, 2.5).count(1.5))

a006 = Nums.new(3.5, 1.5, 2.5)
b006 = 1.5
p b006.class
p a006.count(b006)

p(Nums.new(3.5, 1.5, 2.5).count { |x| x > 2.0 })

a007 = Nums.new(3.5, 1.5, 2.5)
c007 = a007.count { |x| x > 2.0 }
p c007.class
p c007

p(Nums.new("c", "a", "b").count)

a008 = Nums.new("c", "a", "b")
p a008.class
p a008.count

p(Nums.new("c", "a", "b").count("a"))

a009 = Nums.new("c", "a", "b")
b009 = "a"
p b009.class
p a009.count(b009)

p(Nums.new("c", "a", "b").count { |x| x > "a" })

a010 = Nums.new("c", "a", "b")
c010 = a010.count { |x| x > "a" }
p c010.class
p c010

# Enumerable#count called with implicit self from another method of the same class
class BagC
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
  def n401; count; end
  def n402; self.count; end
end
r401 = (BagC.new(1, 2, 3).n401 rescue $!.class); p r401
p(BagC.new(1, 2, 3).n402)
c402 = BagC.new(1, 2, 3).n402; p c402

# Enumerable#count on a user Enumerable bound to a block parameter
p([Nums.new(1, 2), Nums.new(3, 4)].map { |b403| b403.count })
c404 = [Nums.new(1, 2), Nums.new(3, 4)].map { |b404| b404.count }; p c404

# Enumerable#count on a user #each that yields TWO values per element
class PairsC
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(PairsC.new.count)
c405 = PairsC.new.count; p c405
