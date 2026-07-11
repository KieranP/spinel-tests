# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#each_with_index

p(Nums.new(3, 1, 2).each_with_index.to_a)

a001 = Nums.new(3, 1, 2)
p a001.class
p a001.each_with_index.to_a

a002 = Nums.new(3, 1, 2)
c002 = a002.each_with_index.to_a
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).each_with_index.to_a)

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.each_with_index.to_a

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.each_with_index.to_a
p c004.class
p c004

p(Nums.new("a", "b", "c").each_with_index.to_a)

a005 = Nums.new("a", "b", "c")
p a005.class
p a005.each_with_index.to_a

a006 = Nums.new("a", "b", "c")
c006 = a006.each_with_index.to_a
p c006.class
p c006

# Multiple assignment from a heterogeneous returned array leaves the block-only targets
# undeclared in the generated C. Kept commented: a compile abort takes down the whole file.
require "set"
class Cfg930
  def initialize = @t = { [0, "a"] => 1 }
  attr_reader :t
end
def build930 = [Cfg930.new, [Set.new([0]), Set.new([1])], ["a", "b"]]
cfg930, order930, alpha930 = build930
order930.each_with_index { |set930, id930| p [set930.to_a, alpha930.map { |s930| cfg930.t[[id930, s930]] }] }
c930 = order930.each_with_index.to_a; p c930

# Enumerable#each_with_index on a user #each that yields TWO values per element
class Pairs3
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(Pairs3.new.each_with_index.to_a)
c403 = Pairs3.new.each_with_index.to_a; p c403
