# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#lazy
p(Nums.new(3, 1, 2).lazy.map { |x| x * 2 }.first(2))

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.lazy.map { |x| x * 2 }.first(2)

a02 = Nums.new(3, 1, 2)
c02 = a02.lazy.map { |x| x * 2 }.first(2)
p c02.class
p c02

p(Nums.new(3.5, 1.5, 2.5).lazy.map { |x| x * 2 }.first(2))

a03 = Nums.new(3.5, 1.5, 2.5)
p a03.class
p a03.lazy.map { |x| x * 2 }.first(2)

a04 = Nums.new(3.5, 1.5, 2.5)
c04 = a04.lazy.map { |x| x * 2 }.first(2)
p c04.class
p c04

p(Nums.new("a", "b", "c").lazy.map { |x| x * 2 }.first(2))

a05 = Nums.new("a", "b", "c")
p a05.class
p a05.lazy.map { |x| x * 2 }.first(2)

a06 = Nums.new("a", "b", "c")
c06 = a06.lazy.map { |x| x * 2 }.first(2)
p c06.class
p c06

p (1..10).lazy.drop(2).to_a
p (1..10).lazy.drop_while { |x| x < 3 }.to_a
v138 = (1..10).lazy.drop_while { |x| x < 3 }.to_a; p v138
p (1..10).lazy.each_slice(2).to_a
w138 = (1..10).lazy.each_slice(2).to_a; p w138

p (1..Float::INFINITY).lazy.take_while { |x| x < 5 }.to_a
v117 = (1..Float::INFINITY).lazy.take_while { |x| x < 5 }.to_a; p v117

# Enumerable#lazy truncating an INFINITE user #each
class Inf5
  include Enumerable
  def each; i = 1; loop { yield i; i += 1 }; end
end
p(Inf5.new.lazy.map { |x| x * 2 }.first(3))
c405 = Inf5.new.lazy.map { |x| x * 2 }.first(3); p c405
