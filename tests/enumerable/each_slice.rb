# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#each_slice

p(Nums.new(1, 2, 3, 4, 5).each_slice(2).to_a)

a001 = Nums.new(1, 2, 3, 4, 5)
p a001.class
p a001.each_slice(2).to_a

a002 = Nums.new(1, 2, 3, 4, 5)
b002 = 2
p b002.class
p a002.each_slice(b002).to_a

a003 = Nums.new(1, 2, 3, 4, 5)
b003 = 2
c003 = a003.each_slice(b003).to_a
p c003.class
p c003

p(Nums.new(1.1, 2.2, 3.3, 4.4, 5.5).each_slice(2).to_a)

a004 = Nums.new(1.1, 2.2, 3.3, 4.4, 5.5)
p a004.class
p a004.each_slice(2).to_a

a005 = Nums.new(1.1, 2.2, 3.3, 4.4, 5.5)
b005 = 2
p b005.class
p a005.each_slice(b005).to_a

a006 = Nums.new(1.1, 2.2, 3.3, 4.4, 5.5)
b006 = 2
c006 = a006.each_slice(b006).to_a
p c006.class
p c006

p(Nums.new("a", "b", "c", "d", "e").each_slice(2).to_a)

a007 = Nums.new("a", "b", "c", "d", "e")
p a007.class
p a007.each_slice(2).to_a

a008 = Nums.new("a", "b", "c", "d", "e")
b008 = 3
p b008.class
p a008.each_slice(b008).to_a

a009 = Nums.new("a", "b", "c", "d", "e")
b009 = 3
c009 = a009.each_slice(b009).to_a
p c009.class
p c009

p(Nums.new(1, 2, 3, 4).each_slice(2) { |sl010| }.class)
c010 = Nums.new(1, 2, 3, 4).each_slice(2) { |sl010b| }; p c010.class
