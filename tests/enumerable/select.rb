# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#select
p(Nums.new(3, 1, 2).select { |x| x > 1 })

a001 = n
p a001.class
p a001.select { |x| x > 1 }

a002 = Nums.new(3, 1, 2)
c002 = a002.select { |x| x > 1 }
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).select { |x| x > 2.0 })

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.select { |x| x > 2.0 }

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.select { |x| x > 2.0 }
p c004.class
p c004

p(Nums.new("a", "b", "c").select { |x| x > "a" })

a005 = Nums.new("a", "b", "c")
p a005.class
p a005.select { |x| x > "a" }

a006 = Nums.new("a", "b", "c")
c006 = a006.select { |x| x > "a" }
p c006.class
p c006

# Enumerable#select on a user #each that yields TWO values per element
class Pairs1
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(Pairs1.new.select { |k401, v401| v401 == 1 })
c401 = Pairs1.new.select { |k402, v402| v402 == 1 }; p c401
