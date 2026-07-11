# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#eql?
p(Nums.new(3, 1, 2).eql?(Nums.new(3, 1, 2)))
a029 = Nums.new(3, 1, 2); b029 = Nums.new(3, 1, 2); p(a029.eql?(b029))
a030 = Nums.new(3, 1, 2); v030 = a030.eql?(a030); p v030
