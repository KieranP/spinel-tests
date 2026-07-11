# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#collect
p(Nums.new(3, 1, 2).collect { |x| x + 10 })

p n.class
p n.collect { |x| x + 10 }

a001 = Nums.new(3, 1, 2)
c001 = a001.collect { |x| x + 10 }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).collect { |x| x + 10 })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.collect { |x| x + 10 }

a003 = Nums.new(3.5, 1.5, 2.5)
c003 = a003.collect { |x| x + 10 }
p c003.class
p c003

p(Nums.new("c", "a", "b").collect { |x| x + "!" })

a004 = Nums.new("c", "a", "b")
p a004.class
p a004.collect { |x| x + "!" }

a005 = Nums.new("c", "a", "b")
c005 = a005.collect { |x| x + "!" }
p c005.class
p c005
