# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#nil?
p(Nums.new(3, 1, 2).nil?)
a006 = Nums.new(3, 1, 2); p(a006.nil?)
a007 = Nums.new(3, 1, 2); v007 = a007.nil?; p v007
