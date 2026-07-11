# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#flat_map
p(Nums.new(3, 1, 2).flat_map { |x| [x, -x] })

a001 = n
p a001.class
p a001.flat_map { |x| [x, -x] }

a002 = Nums.new(3, 1, 2)
c002 = a002.flat_map { |x| [x, -x] }
p c002.class
p c002

p(Nums.new(1.5, 2.5, 3.5).flat_map { |x| [x, -x] })

a003 = Nums.new(1.5, 2.5, 3.5)
p a003.class
p a003.flat_map { |x| [x, -x] }

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.flat_map { |x| [x, -x] }
p c004.class
p c004

p(Nums.new("a", "bb", "ccc").flat_map { |x| [x, x] })

a005 = Nums.new("a", "bb", "ccc")
p a005.class
p a005.flat_map { |x| [x, x] }

a006 = Nums.new("a", "bb", "ccc")
c006 = a006.flat_map { |x| [x, x] }
p c006.class
p c006

# A combination(2).select{}.map{} chain on a destructured block parameter emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
h960 = { "a" => [1, 2, 3] }
p(h960.flat_map { |k960, r960| r960.combination(2).select { |x960, y960| x960 < y960 }.map { |x961, y961| x961 + y961 } })
v960 = h960.flat_map { |k962, r962| r962.combination(2).select { |x962, y962| x962 < y962 }.map { |x963, y963| x963 + y963 } }; p v960

# Blockless Enumerable#flat_map on a user class returns an Enumerator
r401flat_map = (Nums.new(1, 2, 3).flat_map.class rescue $!.class); p r401flat_map
