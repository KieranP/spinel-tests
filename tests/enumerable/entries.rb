# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#entries

p(Nums.new(3, 1, 2).entries)

a001 = Nums.new(3, 1, 2)
p a001.class
p a001.entries

a002 = Nums.new(3, 1, 2)
c002 = a002.entries
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).entries)

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.entries

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.entries
p c004.class
p c004

p(Nums.new("a", "b", "c").entries)

a005 = Nums.new("a", "b", "c")
p a005.class
p a005.entries

a006 = Nums.new("a", "b", "c")
c006 = a006.entries
p c006.class
p c006
