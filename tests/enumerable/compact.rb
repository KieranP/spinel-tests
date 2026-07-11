# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#compact
p(Nums.new(1, nil, 2, nil, 3).compact)

a001 = Nums.new(1, nil, 2, nil, 3)
p a001.class
p a001.compact

a002 = Nums.new(1, nil, 2, nil, 3)
c002 = a002.compact
p c002.class
p c002

p(Nums.new(1.5, nil, 2.5).compact)

p(Nums.new("a", nil, "b").compact)
