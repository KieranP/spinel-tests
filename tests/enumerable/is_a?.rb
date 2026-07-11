# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#is_a?
p(Nums.new(3, 1, 2).is_a?(Enumerable))
p(Nums.new(3, 1, 2).is_a?(Object))
p(Nums.new(3, 1, 2).is_a?(String))
a014 = Nums.new(3, 1, 2); p(a014.is_a?(Enumerable))
a015 = Nums.new(3, 1, 2); v015 = a015.is_a?(String); p v015
