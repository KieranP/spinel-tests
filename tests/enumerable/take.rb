# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#take
p(Nums.new(3, 1, 2).take(2))

p n.class
p n.take(2)

a001 = Nums.new(3, 1, 2)
b001 = 2
p b001.class
p a001.take(b001)

a002 = Nums.new(3, 1, 2)
b002 = 2
c002 = a002.take(b002)
p c002.class
p c002

p(Nums.new(3, 1, 2).take(0))

p(Nums.new(3.5, 1.5, 2.5).take(2))

a003 = Nums.new(3.5, 1.5, 2.5)
p a003.class
p a003.take(2)

a004 = Nums.new(3.5, 1.5, 2.5)
b004 = 2
c004 = a004.take(b004)
p c004.class
p c004

p(Nums.new("c", "a", "b").take(2))

a005 = Nums.new("c", "a", "b")
p a005.class
p a005.take(2)

a006 = Nums.new("c", "a", "b")
b006 = 2
c006 = a006.take(b006)
p c006.class
p c006

# Enumerable#take truncating an INFINITE user #each
class Inf1
  include Enumerable
  def each; i = 1; loop { yield i; i += 1 }; end
end
p(Inf1.new.take(3))
c401 = Inf1.new.take(3); p c401
