# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#dup
p(Nums.new(3, 1, 2).dup.class)
a037 = Nums.new(3, 1, 2); b037 = a037.dup; p(b037.class)
a038 = Nums.new(3, 1, 2); v038 = a038.dup; p(v038 == a038)
