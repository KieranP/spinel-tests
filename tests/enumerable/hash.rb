# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#hash
p(Nums.new(3, 1, 2).hash.is_a?(Integer))
a022 = Nums.new(3, 1, 2); p(a022.hash == a022.hash)
b022 = Nums.new(3, 1, 2); v022 = (b022.hash == b022.hash); p v022
a023 = Nums.new(3, 1, 2); v023 = (a023.hash.is_a?(Integer)); p v023
