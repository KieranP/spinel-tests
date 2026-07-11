# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#any?

p(Nums.new(3, 1, 2).any? { |x| x > 2 })
p n.class
p n.any? { |x| x > 2 }
c301 = n.any? { |x| x > 2 }
p c301.class
p c301

p(Nums.new(3, 1, 2).any?)
a302 = Nums.new(3, 1, 2)
p a302.class
p a302.any?
c302 = Nums.new(3, 1, 2).any?
p c302.class
p c302

p(Nums.new(1.5, 2.5, 3.5).any? { |x| x > 3.0 })
a303 = Nums.new(1.5, 2.5, 3.5)
p a303.class
p a303.any? { |x| x > 3.0 }
c303 = Nums.new(1.5, 2.5, 3.5).any? { |x| x > 3.0 }
p c303.class
p c303

p(Nums.new("a", "bb", "ccc").any? { |x| x.size > 2 })
a304 = Nums.new("a", "bb", "ccc")
p a304.class
p a304.any? { |x| x.size > 2 }
c304 = Nums.new("a", "bb", "ccc").any? { |x| x.size > 2 }
p c304.class
p c304

p(Nums.new(1, 2, 3).any? { |x| x > 5 })
a305 = Nums.new(1, 2, 3)
p a305.class
p a305.any? { |x| x > 5 }
c305 = Nums.new(1, 2, 3).any? { |x| x > 5 }
p c305.class
p c305

# Pattern-argument overload: a Class pattern works.
p(Nums.new(1, 2, 3).any?(Integer))
c306 = Nums.new(1, 2, 3).any?(Integer); p c306

p(Nums.new(1, 2, 3).any?(2..2))
c307 = Nums.new(1, 2, 3).any?(2..2); p c307
p(Nums.new("a", "b").any?(/a/))
c308 = Nums.new("a", "b").any?(/a/); p c308
