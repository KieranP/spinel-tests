# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#min
p(Nums.new(3, 1, 2).min)

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.min

a02 = Nums.new(3, 1, 2)
c02 = a02.min
p c02.class
p c02

p(Nums.new(3.5, 1.5, 2.5).min)

a03 = Nums.new(3.5, 1.5, 2.5)
p a03.class
p a03.min

a04 = Nums.new(3.5, 1.5, 2.5)
c04 = a04.min
p c04.class
p c04

p(Nums.new("b", "a", "c").min)

a05 = Nums.new("b", "a", "c")
p a05.class
p a05.min

a06 = Nums.new("b", "a", "c")
c06 = a06.min
p c06.class
p c06

# Enumerable#min(n) — the n-smallest form returns an Array
p(Nums.new(3, 1, 2).min(2))

a07 = Nums.new(3, 1, 2)
c07 = a07.min(2)
p c07.class
p c07

# Enumerable#min with a comparator block
p(Nums.new(3, 1, 2).min { |a, b| b <=> a })

a08 = Nums.new(3, 1, 2)
c08 = a08.min { |a, b| b <=> a }
p c08.class
p c08

# Enumerable#min with a negative count raises ArgumentError
r401 = (Nums.new(1, 2).min(-1) rescue $!.class); p r401

# Enumerable#min over an empty and a single-element user #each
class CondMn
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondMn.new([]).min)
c402 = CondMn.new([7]).min; p c402

# Enumerable#min with a comparison block, and the counted form
p(Nums.new(3, 1, 2).min { |x403, y403| y403 <=> x403 })
c404 = Nums.new(3, 1, 2).min(2); p c404
