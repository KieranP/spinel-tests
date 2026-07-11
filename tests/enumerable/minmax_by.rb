# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#minmax_by
p(Nums.new(3, 1, 2).minmax_by { |x| x })

a001 = n
p a001.class
p a001.minmax_by { |x| x }

c001 = a001.minmax_by { |x| x }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).minmax_by { |x| x })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.minmax_by { |x| x }

c002 = a002.minmax_by { |x| x }
p c002.class
p c002

p(Nums.new("c", "a", "b").minmax_by { |x| x })

a003 = Nums.new("c", "a", "b")
p a003.class
p a003.minmax_by { |x| x }

c003 = a003.minmax_by { |x| x }
p c003.class
p c003
