# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#collect_concat
p(Nums.new(3, 1, 2).collect_concat { |x| [x, -x] })

a001 = n
p a001.class
p a001.collect_concat { |x| [x, -x] }

a002 = Nums.new(3, 1, 2)
c002 = a002.collect_concat { |x| [x, -x] }
p c002.class
p c002

p(Nums.new(1.5, 2.5, 3.5).collect_concat { |x| [x, -x] })

a003 = Nums.new(1.5, 2.5, 3.5)
p a003.class
p a003.collect_concat { |x| [x, -x] }

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.collect_concat { |x| [x, -x] }
p c004.class
p c004

p(Nums.new("a", "bb", "ccc").collect_concat { |x| [x, x] })

a005 = Nums.new("a", "bb", "ccc")
p a005.class
p a005.collect_concat { |x| [x, x] }

a006 = Nums.new("a", "bb", "ccc")
c006 = a006.collect_concat { |x| [x, x] }
p c006.class
p c006
