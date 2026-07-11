# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#freeze
a039 = Nums.new(3, 1, 2); a039.freeze; p(a039.frozen?)
a040 = Nums.new(3, 1, 2); v040 = a040.freeze; p(v040.frozen?)
