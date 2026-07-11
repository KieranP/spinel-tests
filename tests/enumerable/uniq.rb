# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#uniq
p(Nums.new(1, 1, 2, 3, 3).uniq)

a001 = Nums.new(1, 1, 2, 3, 3)
p a001.class
p a001.uniq

a002 = Nums.new(1, 1, 2, 3, 3)
c002 = a002.uniq
p c002.class
p c002

p(Nums.new(1.5, 1.5, 2.5, 2.5).uniq)

a003 = Nums.new(1.5, 1.5, 2.5, 2.5)
p a003.class
p a003.uniq

a004 = Nums.new(1.5, 1.5, 2.5, 2.5)
c004 = a004.uniq
p c004.class
p c004

p(Nums.new("a", "a", "b", "c").uniq)

a005 = Nums.new("a", "a", "b", "c")
p a005.class
p a005.uniq

a006 = Nums.new("a", "a", "b", "c")
c006 = a006.uniq
p c006.class
p c006

# Enumerable#uniq with a key block
p(Nums.new(1, 2, 3, 4).uniq { |x| x % 2 })

a007 = Nums.new(1, 2, 3, 4)
c007 = a007.uniq { |x| x % 2 }
p c007.class
p c007

p(Nums.new("a", "bb", "cc", "ddd").uniq { |x| x.length })

a008 = Nums.new("a", "bb", "cc", "ddd")
c008 = a008.uniq { |x| x.length }
p c008.class
p c008
