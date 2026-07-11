# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#inspect
p(Nums.new(3, 1, 2).inspect.is_a?(String))
a033 = Nums.new(3, 1, 2); v033 = a033.inspect; p(v033.is_a?(String))
