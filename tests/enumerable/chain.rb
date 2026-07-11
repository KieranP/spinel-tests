# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#chain
p(Nums.new(1, 2).chain([3, 4], Nums.new(5)).to_a)

a000 = Nums.new(1, 2); c000 = a000.chain([3, 4]); p c000.to_a

a001 = Nums.new(1, 2)
p a001.class
p a001.chain([3, 4]).to_a

a002 = Nums.new(1, 2)
c002 = a002.chain([3, 4]).to_a
p c002.class
p c002

Nums.new(1, 2).chain([3, 4]).each { |x| p x }

p(Nums.new(1.5, 2.5).chain([3.5]).to_a)

p(Nums.new("a", "b").chain(["c"]).to_a)
