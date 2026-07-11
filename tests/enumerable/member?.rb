# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#member?
p(Nums.new(3, 1, 2).member?(2))

a001 = n
p a001.class
p a001.member?(2)

a002 = Nums.new(3, 1, 2)
b002 = 2
p b002.class
p a002.member?(b002)

a003 = Nums.new(3, 1, 2)
b003 = 2
c003 = a003.member?(b003)
p c003.class
p c003

p(Nums.new(3, 1, 2).member?(9))

p(Nums.new(1.5, 2.5, 3.5).member?(2.5))

a004 = Nums.new(1.5, 2.5, 3.5)
p a004.class
p a004.member?(2.5)

a005 = Nums.new(1.5, 2.5, 3.5)
b005 = 2.5
p b005.class
p a005.member?(b005)

a006 = Nums.new(1.5, 2.5, 3.5)
b006 = 2.5
c006 = a006.member?(b006)
p c006.class
p c006

p(Nums.new("a", "b", "c").member?("b"))

a007 = Nums.new("a", "b", "c")
p a007.class
p a007.member?("b")

a008 = Nums.new("a", "b", "c")
b008 = "b"
p b008.class
p a008.member?(b008)

a009 = Nums.new("a", "b", "c")
b009 = "b"
c009 = a009.member?(b009)
p c009.class
p c009
