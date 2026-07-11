# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#drop
p(Nums.new(3, 1, 2).drop(1))

p n.class
p n.drop(1)

a001 = Nums.new(3, 1, 2)
b001 = 1
p b001.class
p a001.drop(b001)

a002 = Nums.new(3, 1, 2)
b002 = 1
c002 = a002.drop(b002)
p c002.class
p c002

p(Nums.new(3.5, 1.5, 2.5).drop(1))

a003 = Nums.new(3.5, 1.5, 2.5)
p a003.class
p a003.drop(1)

a004 = Nums.new(3.5, 1.5, 2.5)
b004 = 1
c004 = a004.drop(b004)
p c004.class
p c004

p(Nums.new("c", "a", "b").drop(1))

a005 = Nums.new("c", "a", "b")
p a005.class
p a005.drop(1)

a006 = Nums.new("c", "a", "b")
b006 = 1
c006 = a006.drop(b006)
p c006.class
p c006
