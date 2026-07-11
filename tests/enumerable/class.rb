# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#class
p(Nums.new(3, 1, 2).class)
a001 = Nums.new(3, 1, 2); p(a001.class)
a002 = Nums.new(3, 1, 2); v002 = a002.class; p v002

# Enumerable.class
p(Enumerable.class)
v003 = Enumerable.class; p v003
