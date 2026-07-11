# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#map
p(Nums.new(3, 1, 2).map { |x| x * 2 })

a01 = Nums.new(3, 1, 2)
p a01.class
p a01.map { |x| x * 2 }

a02 = Nums.new(3, 1, 2)
c02 = a02.map { |x| x * 2 }
p c02.class
p c02

p(Nums.new(3.5, 1.5, 2.5).map { |x| x * 2 })

a03 = Nums.new(3.5, 1.5, 2.5)
p a03.class
p a03.map { |x| x * 2 }

a04 = Nums.new(3.5, 1.5, 2.5)
c04 = a04.map { |x| x * 2 }
p c04.class
p c04

p(Nums.new("a", "b", "c").map { |x| x * 2 })

a05 = Nums.new("a", "b", "c")
p a05.class
p a05.map { |x| x * 2 }

a06 = Nums.new("a", "b", "c")
c06 = a06.map { |x| x * 2 }
p c06.class
p c06

# Enumerable#map on a user #each that yields TWO values per element
class PairsM
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(PairsM.new.map { |k401, v401| [k401, v401] })
c402 = PairsM.new.map { |k402, v402| [k402, v402] }; p c402
p(PairsM.new.map { |x403| x403 })
c403 = PairsM.new.map { |x407| x407 }; p c403

# Enumerable#map on a user #each that never yields
class EmptM; include Enumerable; def each; end; end
p(EmptM.new.map { |x404| x404 })

# Enumerable#map on a user Enumerable bound to a block parameter
p([Nums.new(1, 2), Nums.new(3, 4)].map { |n405| n405.map { |x405| x405 * 2 } })
c406 = [Nums.new(1, 2), Nums.new(3, 4)].map { |n406| n406.map { |x406| x406 * 2 } }; p c406

# Enumerable#map on a user #each that yields over an empty or single-element collection
class CondM
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondM.new([]).map { |x407| x407 * 2 })
c408 = CondM.new([7]).map { |x408| x408 * 2 }; p c408
