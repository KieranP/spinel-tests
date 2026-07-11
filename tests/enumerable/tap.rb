# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#tap
a010 = Nums.new(3, 1, 2); p(a010.tap { |o| o }.equal?(a010))
a011 = Nums.new(3, 1, 2); v011 = a011.tap { |o| o }; p(v011.equal?(a011))
