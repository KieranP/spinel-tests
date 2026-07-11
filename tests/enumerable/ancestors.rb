# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable.ancestors
p(Enumerable.ancestors)
v044 = Enumerable.ancestors; p v044
