# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#sum
p(Nums.new(3, 1, 2).sum)

p n.class
p n.sum

a001 = Nums.new(3, 1, 2)
c001 = a001.sum
p c001.class
p c001

p(Nums.new(3, 1, 2).sum(100))

a002 = Nums.new(3, 1, 2)
b002 = 100
p b002.class
p a002.sum(b002)

a003 = Nums.new(3, 1, 2)
c003 = a003.sum(100)
p c003.class
p c003

p(Nums.new(3, 1, 2).sum { |x| x * 2 })

a004 = Nums.new(3, 1, 2)
c004 = a004.sum { |x| x * 2 }
p c004.class
p c004

p(Nums.new(1.5, 2.5, 3.0).sum)

a005 = Nums.new(1.5, 2.5, 3.0)
c005 = a005.sum
p c005.class
p c005

p(Nums.new(1.5, 2.5, 3.0).sum { |x| x * 2 })

a005b = Nums.new(1.5, 2.5, 3.0)
c005b = a005b.sum { |x| x * 2 }
p c005b.class
p c005b

p(Nums.new(1.5, 2.5, 3.0).sum(1.0))

a006 = Nums.new(1.5, 2.5, 3.0)
c006 = a006.sum(1.0)
p c006.class
p c006

# String concatenation via a String initial value
p(Nums.new("a", "b", "c").sum(""))
a007 = Nums.new("a", "b", "c"); c007 = a007.sum(""); p c007

tbl846 = [["h", 3600], ["m", 60]]
p(["1h", "30m"].sum { |t846| t846[0...-1].to_i * tbl846.find { |l846, _| l846 == t846[-1] }[1] })

u034 = [["d", 86400], ["h", 3600], ["m", 60], ["s", 1]]
r034 = (["1h", "30m"].sum { |t034| lab034 = t034[-1]; u034.find { |l034, _| l034 == lab034 }[1] } rescue $!.class); p r034

r995 = [1, 2, 3].sum do |t995|
  x995 = t995 * 2
  x995
end
p r995

p(Nums.new(1.0, 2.0, 3.0).sum(0))
c970 = Nums.new(1.0, 2.0, 3.0).sum(0); p c970
p(Nums.new(1.5, 2.5).sum(1))
c971 = Nums.new(1.5, 2.5).sum(1); p c971

# Rounding the Rational that Array#sum returns raises NoMethodError.
sr92 = [Rational(1, 2), Rational(1, 4)].sum
r92 = (sr92.round rescue $!.class); p r92
r93 = (sr92.floor rescue $!.class); p r93

# Enumerable#sum on a user Enumerable bound to a block parameter
[Nums.new(1, 2)].each { |b401| p b401.sum }
c402 = [Nums.new(1, 2), Nums.new(3, 4)].map { |b402| b402.sum }; p c402

# Enumerable#sum reached through a method parameter, and on an empty user #each
def tot403(n403); n403.sum; end
p(tot403(Nums.new(1, 2)))
c404 = tot403(Nums.new(1, 2)); p c404
class CondS
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondS.new([]).sum)
c405 = CondS.new([]).sum; p c405
