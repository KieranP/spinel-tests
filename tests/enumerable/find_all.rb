# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#find_all
p(Nums.new(3, 1, 2).find_all { |x| x.odd? })

a001 = n
p a001.class
p a001.find_all { |x| x.odd? }

a002 = Nums.new(3, 1, 2)
c002 = a002.find_all { |x| x.odd? }
p c002.class
p c002

p(Nums.new(1.5, 2.5, 3.5).find_all { |x| x > 2.0 })

a003 = Nums.new(1.5, 2.5, 3.5)
p a003.class
p a003.find_all { |x| x > 2.0 }

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.find_all { |x| x > 2.0 }
p c004.class
p c004

p(Nums.new("a", "bb", "ccc").find_all { |x| x.length > 1 })

a005 = Nums.new("a", "bb", "ccc")
p a005.class
p a005.find_all { |x| x.length > 1 }

a006 = Nums.new("a", "bb", "ccc")
c006 = a006.find_all { |x| x.length > 1 }
p c006.class
p c006
