# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#each_with_object

p(Nums.new(3, 1, 2).each_with_object([]) { |x, acc| acc << x * 2 })

a001 = Nums.new(3, 1, 2)
p a001.class
p a001.each_with_object([]) { |x, acc| acc << x * 2 }

a002 = Nums.new(3, 1, 2)
c002 = a002.each_with_object([]) { |x, acc| acc << x * 2 }
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).each_with_object([]) { |x, acc| acc << x * 2 })

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.each_with_object([]) { |x, acc| acc << x * 2 }

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.each_with_object([]) { |x, acc| acc << x * 2 }
p c004.class
p c004

p(Nums.new("a", "b", "c").each_with_object([]) { |x, acc| acc << x * 2 })

a005 = Nums.new("a", "b", "c")
p a005.class
p a005.each_with_object([]) { |x, acc| acc << x * 2 }

a006 = Nums.new("a", "b", "c")
c006 = a006.each_with_object([]) { |x, acc| acc << x * 2 }
p c006.class
p c006
