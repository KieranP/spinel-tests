# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#filter_map

p(Nums.new(3, 1, 2).filter_map { |x| x * 10 if x > 1 })

a001 = Nums.new(3, 1, 2)
p a001.class
p a001.filter_map { |x| x * 10 if x > 1 }

a002 = Nums.new(3, 1, 2)
c002 = a002.filter_map { |x| x * 10 if x > 1 }
p c002.class
p c002

p(Nums.new(1.1, 2.2, 3.3).filter_map { |x| x * 10 if x > 2.0 })

a003 = Nums.new(1.1, 2.2, 3.3)
p a003.class
p a003.filter_map { |x| x * 10 if x > 2.0 }

a004 = Nums.new(1.1, 2.2, 3.3)
c004 = a004.filter_map { |x| x * 10 if x > 2.0 }
p c004.class
p c004

p(Nums.new("a", "b", "c").filter_map { |x| x * 2 if x > "a" })

a005 = Nums.new("a", "b", "c")
p a005.class
p a005.filter_map { |x| x * 2 if x > "a" }

a006 = Nums.new("a", "b", "c")
c006 = a006.filter_map { |x| x * 2 if x > "a" }
p c006.class
p c006

# filter_map drops the nil that String#rindex returns on a miss.
p(["a", "b/c"].filter_map { |s703| s703.rindex("/") })
v703 = ["a", "b/c"].filter_map { |s705| s705.rindex("/") }; p v703

# filter_map does not drop the nil produced by a short-circuiting &&.
p(["a", "b/c"].filter_map { |s704| i704 = s704.rindex("/"); i704 && s704[0, i704] })
v706 = ["a", "b/c"].filter_map { |s706| i706 = s706.rindex("/"); i706 && s706[0, i706] }; p v706

# Blockless Enumerable#filter_map on a user class returns an Enumerator
r401filter_map = (Nums.new(1, 2, 3).filter_map.class rescue $!.class); p r401filter_map
