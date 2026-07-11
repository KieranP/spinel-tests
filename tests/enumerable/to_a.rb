# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#to_a
p(Nums.new(3, 1, 2).to_a)

a001 = Nums.new(3, 1, 2)
p a001.class
p a001.to_a

a002 = Nums.new(3, 1, 2)
c002 = a002.to_a
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).to_a)

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.to_a

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.to_a
p c004.class
p c004

p(Nums.new("x", "y", "z").to_a)

a005 = Nums.new("x", "y", "z")
p a005.class
p a005.to_a

a006 = Nums.new("x", "y", "z")
c006 = a006.to_a
p c006.class
p c006

# Enumerable#to_a on a user #each that yields TWO values per element
class PairsT
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(PairsT.new.to_a)
c401 = PairsT.new.to_a; p c401

# Enumerable#to_a on a user #each that never yields
class EmptT; include Enumerable; def each; end; end
p(EmptT.new.to_a)
r402 = (EmptT.new.to_a rescue $!.class); p r402

# Enumerable#to_a on a user #each that yields over an empty or single-element collection
class CondT
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondT.new([]).to_a)
c403 = CondT.new([]).to_a; p c403
p(CondT.new([7]).to_a)
c404 = CondT.new([7]).to_a; p c404
