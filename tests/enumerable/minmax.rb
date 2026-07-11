# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#minmax
p(Nums.new(3, 1, 2).minmax)

a001 = n
p a001.class
p a001.minmax

c001 = a001.minmax
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).minmax)

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.minmax

c002 = a002.minmax
p c002.class
p c002

p(Nums.new("c", "a", "b").minmax)

a003 = Nums.new("c", "a", "b")
p a003.class
p a003.minmax

c003 = a003.minmax
p c003.class
p c003

# Enumerable#minmax with a comparator block
p(Nums.new(3, 1, 2).minmax { |a, b| a <=> b })

a004 = Nums.new(3, 1, 2)
c004 = a004.minmax { |a, b| a <=> b }
p c004.class
p c004
