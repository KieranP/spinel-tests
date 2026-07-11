# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#all?

p(Nums.new(3, 1, 2).all? { |x| x > 0 })
p n.class
p n.all? { |x| x > 0 }
c201 = n.all? { |x| x > 0 }
p c201.class
p c201

p(Nums.new(3, 1, 2).all?)
a202 = Nums.new(3, 1, 2)
p a202.class
p a202.all?
c202 = Nums.new(3, 1, 2).all?
p c202.class
p c202

p(Nums.new(1.5, 2.5, 3.5).all? { |x| x > 1.0 })
a203 = Nums.new(1.5, 2.5, 3.5)
p a203.class
p a203.all? { |x| x > 1.0 }
c203 = Nums.new(1.5, 2.5, 3.5).all? { |x| x > 1.0 }
p c203.class
p c203

p(Nums.new("a", "bb", "ccc").all? { |x| x.size > 0 })
a204 = Nums.new("a", "bb", "ccc")
p a204.class
p a204.all? { |x| x.size > 0 }
c204 = Nums.new("a", "bb", "ccc").all? { |x| x.size > 0 }
p c204.class
p c204

p(Nums.new(1, 2, -3).all? { |x| x > 0 })
a205 = Nums.new(1, 2, -3)
p a205.class
p a205.all? { |x| x > 0 }
c205 = Nums.new(1, 2, -3).all? { |x| x > 0 }
p c205.class
p c205

# Pattern-argument overload: a Class pattern works.
p(Nums.new(1, 2, 3).all?(Integer))
c206 = Nums.new(1, 2, 3).all?(Integer); p c206

p(Nums.new(1, 2, 3).all?(1..3))
c207 = Nums.new(1, 2, 3).all?(1..3); p c207
p(Nums.new("a", "b").all?(/a|b/))
c208 = Nums.new("a", "b").all?(/a|b/); p c208
