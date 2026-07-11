# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#chunk_while

p(Nums.new(3, 1, 2).chunk_while { |a, b| b - a == 1 }.to_a)
p n.class
p n.chunk_while { |a, b| b - a == 1 }.to_a
c501 = n.chunk_while { |a, b| b - a == 1 }.to_a
p c501.class
p c501

p(Nums.new(1, 2, 4, 5).chunk_while { |a, b| b - a == 1 }.to_a)
a502 = Nums.new(1, 2, 4, 5)
p a502.class
p a502.chunk_while { |a, b| b - a == 1 }.to_a
c502 = Nums.new(1, 2, 4, 5).chunk_while { |a, b| b - a == 1 }.to_a
p c502.class
p c502

p(Nums.new(1.0, 1.5, 3.0, 3.5).chunk_while { |a, b| b - a < 1.0 }.to_a)
a503 = Nums.new(1.0, 1.5, 3.0, 3.5)
p a503.class
p a503.chunk_while { |a, b| b - a < 1.0 }.to_a
c503 = Nums.new(1.0, 1.5, 3.0, 3.5).chunk_while { |a, b| b - a < 1.0 }.to_a
p c503.class
p c503

p(Nums.new("a", "b", "a", "b").chunk_while { |a, b| a < b }.to_a)
a504 = Nums.new("a", "b", "a", "b")
p a504.class
p a504.chunk_while { |a, b| a < b }.to_a
c504 = Nums.new("a", "b", "a", "b").chunk_while { |a, b| a < b }.to_a
p c504.class
p c504

# On a Hash returned by a seedless Array#reduce.
a82cw = { n: 1, s: { x: 2 } }
h82cw = [a82cw].reduce { |acc82cw, l82cw| acc82cw }
r82cw = (h82cw.chunk_while { |x82cw, y82cw| true }.to_a rescue $!.class); p r82cw
