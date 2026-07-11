# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#none?
p(Nums.new(3, 1, 2).none? { |x| x > 5 })

a001 = n
p a001.class
p a001.none? { |x| x > 5 }

c001 = a001.none? { |x| x > 5 }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).none? { |x| x > 2.0 })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.none? { |x| x > 2.0 }

c002 = a002.none? { |x| x > 2.0 }
p c002.class
p c002

p(Nums.new("c", "a", "b").none? { |x| x > "z" })

a003 = Nums.new("c", "a", "b")
p a003.class
p a003.none? { |x| x > "z" }

c003 = a003.none? { |x| x > "z" }
p c003.class
p c003

# Pattern-argument overload: a Class pattern works.
p(Nums.new(1, 2, 3).none?(String))
c004 = Nums.new(1, 2, 3).none?(String); p c004

p(Nums.new(1, 2, 3).none?(2..2))
c005 = Nums.new(1, 2, 3).none?(2..2); p c005
