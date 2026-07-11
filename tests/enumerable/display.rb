# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#display
Nums.new(3, 1, 2).class.display
puts
a041 = Nums.new(3, 1, 2); v041 = a041.class.display; puts; p v041
