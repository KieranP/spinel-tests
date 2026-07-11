# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#equal?
a026 = Nums.new(3, 1, 2); p(a026.equal?(a026))
a027 = Nums.new(3, 1, 2); b027 = Nums.new(3, 1, 2); p(a027.equal?(b027))
a028 = Nums.new(3, 1, 2); v028 = a028.equal?(a028); p v028
