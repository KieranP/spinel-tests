# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

# Enumerable#to_h
p(Nums.new([1, 2], [3, 4]).to_h)

a001 = Nums.new([1, 2], [3, 4])
p a001.class
p a001.to_h

a002 = Nums.new([1, 2], [3, 4])
c002 = a002.to_h
p c002.class
p c002

p(Nums.new(["a", 1], ["b", 2]).to_h)

a003 = Nums.new(["a", 1], ["b", 2])
p a003.class
p a003.to_h

a004 = Nums.new(["a", 1], ["b", 2])
c004 = a004.to_h
p c004.class
p c004

# Enumerable#to_h with a block
p(Nums.new(1, 2, 3).to_h { |x| [x, x * x] })

a005 = Nums.new(1, 2, 3)
p a005.class
p a005.to_h { |x| [x, x * x] }

a006 = Nums.new(1, 2, 3)
c006 = a006.to_h { |x| [x, x * x] }
p c006.class
p c006

p(Nums.new("a", "bb").to_h { |x| [x, x.length] })

a007 = Nums.new("a", "bb")
c007 = a007.to_h { |x| [x, x.length] }
p c007.class
p c007

# Enumerable#to_h on a user #each that yields TWO values per element
class PairsH
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(PairsH.new.to_h)
c401 = PairsH.new.to_h; p c401

# Enumerable#to_h with a block on the same receiver
p(PairsH.new.to_h { |k402, v402| [k402, v402] })
c403 = PairsH.new.to_h { |k403, v403| [k403, v403] }; p c403
