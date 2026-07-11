# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#drop_while
p(Nums.new(3, 1, 2).drop_while { |x| x > 1 })

p n.class
p n.drop_while { |x| x > 1 }

a001 = Nums.new(3, 1, 2)
c001 = a001.drop_while { |x| x > 1 }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).drop_while { |x| x > 1.0 })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.drop_while { |x| x > 1.0 }

a003 = Nums.new(3.5, 1.5, 2.5)
c003 = a003.drop_while { |x| x > 1.0 }
p c003.class
p c003

p(Nums.new("c", "a", "b").drop_while { |x| x > "a" })

a004 = Nums.new("c", "a", "b")
p a004.class
p a004.drop_while { |x| x > "a" }

a005 = Nums.new("c", "a", "b")
c005 = a005.drop_while { |x| x > "a" }
p c005.class
p c005

# Blockless Enumerable#drop_while on a user class returns an Enumerator
r401drop_while = (Nums.new(1, 2, 3).drop_while.class rescue $!.class); p r401drop_while
