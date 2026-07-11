# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#frozen?
p(Nums.new(3, 1, 2).frozen?)
a004 = Nums.new(3, 1, 2); p(a004.frozen?)
a005 = Nums.new(3, 1, 2); v005 = a005.frozen?; p v005
