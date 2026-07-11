# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#filter

p(Nums.new(3, 1, 2).filter { |x| x > 1 })

a001 = Nums.new(3, 1, 2)
p a001.class
p a001.filter { |x| x > 1 }

a002 = Nums.new(3, 1, 2)
c002 = a002.filter { |x| x > 1 }
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).filter { |x| x > 2.0 })

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.filter { |x| x > 2.0 }

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.filter { |x| x > 2.0 }
p c004.class
p c004

p(Nums.new("a", "b", "c").filter { |x| x > "a" })

a005 = Nums.new("a", "b", "c")
p a005.class
p a005.filter { |x| x > "a" }

a006 = Nums.new("a", "b", "c")
c006 = a006.filter { |x| x > "a" }
p c006.class
p c006
