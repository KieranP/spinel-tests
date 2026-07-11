# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#respond_to?
p(Nums.new(3, 1, 2).respond_to?(:map))
p(Nums.new(3, 1, 2).respond_to?(:definitely_not_a_method_xyz))
a020 = Nums.new(3, 1, 2); p(a020.respond_to?(:map))
a021 = Nums.new(3, 1, 2); v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
