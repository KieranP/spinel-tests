# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#max
p(Nums.new(3, 1, 2).max)

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.max

a02 = Nums.new(3, 1, 2)
c02 = a02.max
p c02.class
p c02

p(Nums.new(3.5, 1.5, 2.5).max)

a03 = Nums.new(3.5, 1.5, 2.5)
p a03.class
p a03.max

a04 = Nums.new(3.5, 1.5, 2.5)
c04 = a04.max
p c04.class
p c04

p(Nums.new("b", "a", "c").max)

a05 = Nums.new("b", "a", "c")
p a05.class
p a05.max

a06 = Nums.new("b", "a", "c")
c06 = a06.max
p c06.class
p c06

# Enumerable#max(n) — the n-largest form returns an Array
p(Nums.new(3, 1, 2).max(2))

a07 = Nums.new(3, 1, 2)
c07 = a07.max(2)
p c07.class
p c07

# Enumerable#max with a comparator block
p(Nums.new(3, 1, 2).max { |a, b| b <=> a })

a08 = Nums.new(3, 1, 2)
c08 = a08.max { |a, b| b <=> a }
p c08.class
p c08

# Enumerable#max with a negative count raises ArgumentError
r401 = (Nums.new(1, 2).max(-1) rescue $!.class); p r401

# Enumerable#max over an empty and a single-element user #each
class CondMx
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondMx.new([]).max)
c402 = CondMx.new([7]).max; p c402

# Enumerable#max with a comparison block, and the counted form
p(Nums.new(3, 1, 2).max { |x403, y403| y403 <=> x403 })
c404 = Nums.new(3, 1, 2).max(2); p c404
