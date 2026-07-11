# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#find
p(Nums.new(3, 1, 2).find { |x| x < 3 })

a001 = n
p a001.class
p a001.find { |x| x < 3 }

a002 = Nums.new(3, 1, 2)
c002 = a002.find { |x| x < 3 }
p c002.class
p c002

p(Nums.new(1.5, 2.5, 3.5).find { |x| x > 2.0 })

a003 = Nums.new(1.5, 2.5, 3.5)
p a003.class
p a003.find { |x| x > 2.0 }

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.find { |x| x > 2.0 }
p c004.class
p c004

p(Nums.new("a", "bb", "ccc").find { |x| x.length > 1 })

a005 = Nums.new("a", "bb", "ccc")
p a005.class
p a005.find { |x| x.length > 1 }

a006 = Nums.new("a", "bb", "ccc")
c006 = a006.find { |x| x.length > 1 }
p c006.class
p c006

# Enumerable#find with an ifnone proc (invoked when nothing matches)
p(Nums.new(1, 2, 3).find(-> { :none }) { |x| x > 9 })

a007 = Nums.new(1, 2, 3)
c007 = a007.find(-> { :none }) { |x| x > 9 }
p c007.class
p c007

# Blockless Enumerable#find on a user class returns an Enumerator
r401find = (Nums.new(1, 2, 3).find.class rescue $!.class); p r401find

# Enumerable#find truncating an INFINITE user #each
class Inf2
  include Enumerable
  def each; i = 1; loop { yield i; i += 1 }; end
end
p(Inf2.new.find { |x| x > 3 })
c402 = Inf2.new.find { |x| x > 3 }; p c402
