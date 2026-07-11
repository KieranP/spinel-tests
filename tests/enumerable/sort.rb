# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#sort
p(Nums.new(3, 1, 2).sort)

a001 = n
p a001.class
p a001.sort

a002 = Nums.new(3, 1, 2)
c002 = a002.sort
p c002.class
p c002

# Enumerable#sort with a block
p(Nums.new(3, 1, 2).sort { |a, b| b <=> a })

a003 = Nums.new(3, 1, 2)
c003 = a003.sort { |a, b| b <=> a }
p c003.class
p c003

p(Nums.new(3.5, 1.5, 2.5).sort)

a004 = Nums.new(3.5, 1.5, 2.5)
p a004.class
p a004.sort

a005 = Nums.new(3.5, 1.5, 2.5)
c005 = a005.sort
p c005.class
p c005

p(Nums.new("c", "a", "b").sort)

a006 = Nums.new("c", "a", "b")
p a006.class
p a006.sort

a007 = Nums.new("c", "a", "b")
c007 = a007.sort
p c007.class
p c007
