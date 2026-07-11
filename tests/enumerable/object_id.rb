# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#object_id
p(Nums.new(3, 1, 2).object_id.is_a?(Integer))
a024 = Nums.new(3, 1, 2); p(a024.object_id == a024.object_id)
a025 = Nums.new(3, 1, 2); v025 = (a025.object_id.is_a?(Integer)); p v025
