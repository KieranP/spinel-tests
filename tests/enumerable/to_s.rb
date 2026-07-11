# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#to_s
p(Nums.new(3, 1, 2).to_s.is_a?(String))
a035 = Nums.new(3, 1, 2); v035 = a035.to_s; p(v035.is_a?(String))
