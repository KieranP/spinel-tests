# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#kind_of?
p(Nums.new(3, 1, 2).kind_of?(Enumerable))
p(Nums.new(3, 1, 2).kind_of?(Object))
p(Nums.new(3, 1, 2).kind_of?(String))
a016 = Nums.new(3, 1, 2); p(a016.kind_of?(Enumerable))
a017 = Nums.new(3, 1, 2); v017 = a017.kind_of?(String); p v017
