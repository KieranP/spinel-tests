# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(1, 2, 4, 5)

# Enumerable#slice_when
p(Nums.new(1, 2, 4, 5).slice_when { |a, b| b - a > 1 }.to_a)

p n.class
p n.slice_when { |a, b| b - a > 1 }.to_a

a001 = Nums.new(1, 2, 4, 5)
c001 = a001.slice_when { |a, b| b - a > 1 }.to_a
p c001.class
p c001

p(Nums.new(1.0, 1.5, 3.0, 3.5).slice_when { |a, b| b - a > 1.0 }.to_a)

a002 = Nums.new(1.0, 1.5, 3.0, 3.5)
p a002.class
p a002.slice_when { |a, b| b - a > 1.0 }.to_a

a003 = Nums.new(1.0, 1.5, 3.0, 3.5)
c003 = a003.slice_when { |a, b| b - a > 1.0 }.to_a
p c003.class
p c003

p(Nums.new("a", "b", "a", "b").slice_when { |a, b| a > b }.to_a)

a004 = Nums.new("a", "b", "a", "b")
p a004.class
p a004.slice_when { |a, b| a > b }.to_a

a005 = Nums.new("a", "b", "a", "b")
c005 = a005.slice_when { |a, b| a > b }.to_a
p c005.class
p c005
