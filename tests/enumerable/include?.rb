# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#include?
p(Nums.new(3, 1, 2).include?(2))

a001 = n
p a001.class
p a001.include?(2)

a002 = Nums.new(3, 1, 2)
b002 = 2
p b002.class
p a002.include?(b002)

a003 = Nums.new(3, 1, 2)
b003 = 2
c003 = a003.include?(b003)
p c003.class
p c003

p(Nums.new(1.5, 2.5, 3.5).include?(2.5))

a004 = Nums.new(1.5, 2.5, 3.5)
p a004.class
p a004.include?(2.5)

a005 = Nums.new(1.5, 2.5, 3.5)
b005 = 2.5
p b005.class
p a005.include?(b005)

a006 = Nums.new(1.5, 2.5, 3.5)
b006 = 2.5
c006 = a006.include?(b006)
p c006.class
p c006

p(Nums.new("a", "b", "c").include?("b"))

a007 = Nums.new("a", "b", "c")
p a007.class
p a007.include?("b")

a008 = Nums.new("a", "b", "c")
b008 = "b"
p b008.class
p a008.include?(b008)

a009 = Nums.new("a", "b", "c")
b009 = "b"
c009 = a009.include?(b009)
p c009.class
p c009

# Enumerable#include? truncating an INFINITE user #each
class Inf3
  include Enumerable
  def each; i = 1; loop { yield i; i += 1 }; end
end
p(Inf3.new.include?(3))
c403 = Inf3.new.include?(3); p c403

# Enumerable#include? on a user #each that yields TWO values per element
class Pairs6
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(Pairs6.new.include?([:a, 1]))
c406 = Pairs6.new.include?([:a, 1]); p c406
