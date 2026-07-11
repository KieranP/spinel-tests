# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#cycle
acc001 = []; Nums.new(1, 2, 3).cycle(2) { |x| acc001 << x }; p acc001

acc002 = []
p n.class
n.cycle(2) { |x| acc002 << x }
p acc002

acc003 = []
b003 = 2
p b003.class
Nums.new(1, 2, 3).cycle(b003) { |x| acc003 << x }
p acc003

acc005 = []; Nums.new(1.1, 2.2, 3.3).cycle(2) { |x| acc005 << x }; p acc005

acc006 = []
a006 = Nums.new(1.1, 2.2, 3.3)
p a006.class
a006.cycle(2) { |x| acc006 << x }
p acc006

acc008 = []; Nums.new("a", "b", "c").cycle(2) { |x| acc008 << x }; p acc008

acc009 = []
a009 = Nums.new("a", "b", "c")
p a009.class
a009.cycle(2) { |x| acc009 << x }
p acc009

# Blockless Enumerable#cycle with no count emits C naming an undeclared type; kept commented
# because the abort takes down the whole file.
p(Nums.new(1, 2).cycle.first(5))
c401 = Nums.new(1, 2).cycle.take(4); p c401

# The same enumerator asked only for its class compiles, but raises.
r402 = (Nums.new(1, 2).cycle.class rescue $!.class); p r402

# Blockless Enumerable#cycle WITH a count works
p(Nums.new(1, 2).cycle(2).to_a)
c403 = Nums.new(1, 2).cycle(2).to_a; p c403
