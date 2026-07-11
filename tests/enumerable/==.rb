# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#==
p(Nums.new(3, 1, 2) == Nums.new(3, 1, 2))
a031 = Nums.new(3, 1, 2); b031 = Nums.new(3, 1, 2); p(a031 == b031)
a032 = Nums.new(3, 1, 2); v032 = (a032 == a032); p v032
