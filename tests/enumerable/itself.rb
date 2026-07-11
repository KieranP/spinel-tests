# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#itself
a008 = Nums.new(3, 1, 2); p(a008.itself.equal?(a008))
a009 = Nums.new(3, 1, 2); v009 = a009.itself; p(v009.equal?(a009))
