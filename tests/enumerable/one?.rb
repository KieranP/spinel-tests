# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#one?
p(Nums.new(3, 1, 2).one? { |x| x == 2 })

a001 = n
p a001.class
p a001.one? { |x| x == 2 }

c001 = a001.one? { |x| x == 2 }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).one? { |x| x == 2.5 })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.one? { |x| x == 2.5 }

c002 = a002.one? { |x| x == 2.5 }
p c002.class
p c002

p(Nums.new("c", "a", "b").one? { |x| x == "b" })

a003 = Nums.new("c", "a", "b")
p a003.class
p a003.one? { |x| x == "b" }

c003 = a003.one? { |x| x == "b" }
p c003.class
p c003

# Pattern-argument overload: a Class pattern works.
p(Nums.new(1, 2, 3).one?(Integer))
c004 = Nums.new(1, 2, 3).one?(Integer); p c004

p(Nums.new(1, 2, 3).one?(2..2))
c005 = Nums.new(1, 2, 3).one?(2..2); p c005
