# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#instance_of?
p(Nums.new(3, 1, 2).instance_of?(Nums))
p(Nums.new(3, 1, 2).instance_of?(String))
a018 = Nums.new(3, 1, 2); p(a018.instance_of?(Nums))
a019 = Nums.new(3, 1, 2); v019 = a019.instance_of?(String); p v019
