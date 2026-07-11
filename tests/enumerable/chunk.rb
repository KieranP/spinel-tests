# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(1, 1, 2, 3, 3)

# Enumerable#chunk
p(Nums.new(1, 1, 2, 3, 3).chunk { |x| x }.to_a)

p n.class
p n.chunk { |x| x }.to_a

a001 = Nums.new(1, 1, 2, 3, 3)
c001 = a001.chunk { |x| x }.to_a
p c001.class
p c001

p(Nums.new(1.1, 1.1, 2.2, 3.3, 3.3).chunk { |x| x }.to_a)

a002 = Nums.new(1.1, 1.1, 2.2, 3.3, 3.3)
p a002.class
p a002.chunk { |x| x }.to_a

a003 = Nums.new(1.1, 1.1, 2.2, 3.3, 3.3)
c003 = a003.chunk { |x| x }.to_a
p c003.class
p c003

p(Nums.new("a", "a", "b", "c", "c").chunk { |x| x }.to_a)

a004 = Nums.new("a", "a", "b", "c", "c")
p a004.class
p a004.chunk { |x| x }.to_a

a005 = Nums.new("a", "a", "b", "c", "c")
c005 = a005.chunk { |x| x }.to_a
p c005.class
p c005
