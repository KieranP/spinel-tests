# frozen_string_literal: true
require "set"

class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(1, 2, 2, 3)

# Enumerable#to_set
p(Nums.new(1, 2, 2, 3).to_set)
a001 = n
p a001.class
p a001.to_set
a002 = Nums.new(1, 2, 2, 3)
c002 = a002.to_set
p c002.class
p c002
p(Nums.new(1.5, 2.5, 2.5).to_set)
a003 = Nums.new(1.5, 2.5, 2.5)
c003 = a003.to_set
p c003.class
p c003
p(Nums.new("a", "b", "b").to_set)
a004 = Nums.new("a", "b", "b")
c004 = a004.to_set
p c004.class
p c004

# Enumerable#to_set on an empty and a single-element user #each
class CondTs
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondTs.new([]).to_set)
c401 = CondTs.new([7]).to_set; p c401

# A #to_set anywhere in the program makes a comparison block on a user Enumerable an
# unsupported call; kept commented because the abort takes down the whole file.
p(Nums.new(3, 1, 2).min { |x402, y402| y402 <=> x402 })
c403 = Nums.new(3, 1, 2).sort { |x403, y403| y403 <=> x403 }; p c403
