# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#take_while
p(Nums.new(3, 1, 2).take_while { |x| x > 1 })

p n.class
p n.take_while { |x| x > 1 }

a001 = Nums.new(3, 1, 2)
c001 = a001.take_while { |x| x > 1 }
p c001.class
p c001

p(Nums.new(3.5, 2.5, 1.5).take_while { |x| x > 2.0 })

a002 = Nums.new(3.5, 2.5, 1.5)
p a002.class
p a002.take_while { |x| x > 2.0 }

a003 = Nums.new(3.5, 2.5, 1.5)
c003 = a003.take_while { |x| x > 2.0 }
p c003.class
p c003

p(Nums.new("c", "b", "a").take_while { |x| x > "a" })

a004 = Nums.new("c", "b", "a")
p a004.class
p a004.take_while { |x| x > "a" }

a005 = Nums.new("c", "b", "a")
c005 = a005.take_while { |x| x > "a" }
p c005.class
p c005

# Blockless Enumerable#take_while on a user class returns an Enumerator
r401take_while = (Nums.new(1, 2, 3).take_while.class rescue $!.class); p r401take_while

# Enumerable#take_while truncating an INFINITE user #each
class Inf4
  include Enumerable
  def each; i = 1; loop { yield i; i += 1 }; end
end
p(Inf4.new.take_while { |x| x < 4 })
c404 = Inf4.new.take_while { |x| x < 4 }; p c404
