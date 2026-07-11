# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#reverse_each with a block
Nums.new(3, 1, 2).reverse_each { |x| p x }

a001 = n
p a001.class
a001.reverse_each { |x| p x }

a002 = Nums.new(3, 1, 2)
c002 = a002.reverse_each { |x| p x }
p c002.class

Nums.new(1.5, 2.5, 3.5).reverse_each { |x| p x }

Nums.new("a", "b", "c").reverse_each { |x| p x }

# Enumerable#reverse_each with no block returns an Enumerator (over an arbitrary
# user #each), which Spinel does not support (see limitations.md, external Enumerator).
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(Nums.new(3, 1, 2).reverse_each.to_a)
