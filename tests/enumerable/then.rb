# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#then
a012 = Nums.new(3, 1, 2); p(a012.then { |o| o.equal?(a012) })
a013 = Nums.new(3, 1, 2); v013 = a013.then { |o| o.equal?(a013) }; p v013
