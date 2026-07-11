# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#tally
p(Nums.new(1, 1, 2, 3, 3, 3).tally)

a001 = Nums.new(1, 1, 2, 3, 3, 3)
p a001.class
p a001.tally

a002 = Nums.new(1, 1, 2, 3, 3, 3)
c002 = a002.tally
p c002.class
p c002

p(Nums.new(1.5, 1.5, 2.5).tally)

a003 = Nums.new(1.5, 1.5, 2.5)
p a003.class
p a003.tally

a004 = Nums.new(1.5, 1.5, 2.5)
c004 = a004.tally
p c004.class
p c004

p(Nums.new("a", "a", "b").tally)

a005 = Nums.new("a", "a", "b")
p a005.class
p a005.tally

a006 = Nums.new("a", "a", "b")
c006 = a006.tally
p c006.class
p c006

# Enumerable#tally(hash) — adds counts into the given accumulator hash
b007 = {1 => 10}; p(Nums.new(1, 2, 2).tally(b007))
a007 = Nums.new(1, 2, 2); b007b = {1 => 10}; c007 = a007.tally(b007b); p c007
