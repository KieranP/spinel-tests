# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#reject
p(Nums.new(3, 1, 2).reject { |x| x > 1 })

a001 = n
p a001.class
p a001.reject { |x| x > 1 }

c001 = a001.reject { |x| x > 1 }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).reject { |x| x > 2.0 })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.reject { |x| x > 2.0 }

c002 = a002.reject { |x| x > 2.0 }
p c002.class
p c002

p(Nums.new("c", "a", "b").reject { |x| x > "a" })

a003 = Nums.new("c", "a", "b")
p a003.class
p a003.reject { |x| x > "a" }

c003 = a003.reject { |x| x > "a" }
p c003.class
p c003
