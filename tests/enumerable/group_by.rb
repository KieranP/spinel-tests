# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#group_by
p(Nums.new(1, 2, 3, 4).group_by { |x| x.even? })

a001 = Nums.new(1, 2, 3, 4)
p a001.class
p a001.group_by { |x| x.even? }

a002 = Nums.new(1, 2, 3, 4)
c002 = a002.group_by { |x| x.even? }
p c002.class
p c002

p(Nums.new(1.5, 2.5, 3.5).group_by { |x| x > 2.0 })

a003 = Nums.new(1.5, 2.5, 3.5)
p a003.class
p a003.group_by { |x| x > 2.0 }

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.group_by { |x| x > 2.0 }
p c004.class
p c004

p(Nums.new("a", "bb", "cc", "ddd").group_by { |x| x.length })

a005 = Nums.new("a", "bb", "cc", "ddd")
p a005.class
p a005.group_by { |x| x.length }

a006 = Nums.new("a", "bb", "cc", "ddd")
c006 = a006.group_by { |x| x.length }
p c006.class
p c006

class Graph338
  def key338(x) = x % 3
  def buckets338 = (0...6).group_by { |x| key338(x) }
end
p Graph338.new.buckets338
g338 = Graph338.new; c338 = g338.buckets338; p c338

r550e = ([0, 1, 2, 3].group_by { |x550e| x550e % 2 }[0].sort rescue $!.class); p r550e

# Blockless Enumerable#group_by on a user class returns an Enumerator
r401group_by = (Nums.new(1, 2, 3).group_by.class rescue $!.class); p r401group_by
