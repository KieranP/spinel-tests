# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#first
p(Nums.new(3, 1, 2).first)

a001 = n
p a001.class
p a001.first

a002 = Nums.new(3, 1, 2)
c002 = a002.first
p c002.class
p c002

p(Nums.new(1.5, 2.5, 3.5).first)

a003 = Nums.new(1.5, 2.5, 3.5)
p a003.class
p a003.first

a004 = Nums.new(1.5, 2.5, 3.5)
c004 = a004.first
p c004.class
p c004

p(Nums.new("a", "bb", "ccc").first)

a005 = Nums.new("a", "bb", "ccc")
p a005.class
p a005.first

a006 = Nums.new("a", "bb", "ccc")
c006 = a006.first
p c006.class
p c006

# Enumerable#first(n)
p(Nums.new(3, 1, 2).first(2))

a007 = Nums.new(3, 1, 2)
p a007.class
p a007.first(2)

a008 = Nums.new(3, 1, 2)
b008 = 2
p b008.class
p a008.first(b008)

a009 = Nums.new(3, 1, 2)
b009 = 2
c009 = a009.first(b009)
p c009.class
p c009

p(Nums.new(1.5, 2.5, 3.5).first(2))

a010 = Nums.new(1.5, 2.5, 3.5)
p a010.class
p a010.first(2)

a011 = Nums.new(1.5, 2.5, 3.5)
b011 = 2
p b011.class
p a011.first(b011)

a012 = Nums.new(1.5, 2.5, 3.5)
b012 = 2
c012 = a012.first(b012)
p c012.class
p c012

p(Nums.new("a", "bb", "ccc").first(2))

a013 = Nums.new("a", "bb", "ccc")
p a013.class
p a013.first(2)

a014 = Nums.new("a", "bb", "ccc")
b014 = 2
p b014.class
p a014.first(b014)

a015 = Nums.new("a", "bb", "ccc")
b015 = 2
c015 = a015.first(b015)
p c015.class
p c015

# Enumerable#first over an empty and a single-element user #each
class CondF
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
p(CondF.new([]).first)
p(CondF.new([]).first(2))
c401 = CondF.new([7]).first; p c401
c402 = CondF.new([7]).first(5); p c402

# Enumerable#first truncating an INFINITE user #each
class InfF
  include Enumerable
  def each; i = 1; loop { yield i; i += 1 }; end
end
p(InfF.new.first)
c403 = InfF.new.first(3); p c403

# Enumerable#first on a user #each that yields TWO values per element
class Pairs5
  include Enumerable
  def each; yield :a, 1; yield :b, 2; end
end
p(Pairs5.new.first)
c405 = Pairs5.new.first; p c405

# Enumerable#first on a receiver bound to a BLOCK PARAMETER
p([Nums.new(1, 2), Nums.new(3, 4)].map { |n406| n406.first })
c407 = [Nums.new(1, 2), Nums.new(3, 4)].map { |n407| n407.first }; p c407
