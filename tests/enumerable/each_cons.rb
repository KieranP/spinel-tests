# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#each_cons

p(Nums.new(1, 2, 3, 4).each_cons(2).to_a)

a001 = Nums.new(1, 2, 3, 4)
p a001.class
p a001.each_cons(2).to_a

a002 = Nums.new(1, 2, 3, 4)
b002 = 2
p b002.class
p a002.each_cons(b002).to_a

a003 = Nums.new(1, 2, 3, 4)
b003 = 2
c003 = a003.each_cons(b003).to_a
p c003.class
p c003

p(Nums.new(1.1, 2.2, 3.3, 4.4).each_cons(2).to_a)

a004 = Nums.new(1.1, 2.2, 3.3, 4.4)
p a004.class
p a004.each_cons(2).to_a

a005 = Nums.new(1.1, 2.2, 3.3, 4.4)
b005 = 2
p b005.class
p a005.each_cons(b005).to_a

a006 = Nums.new(1.1, 2.2, 3.3, 4.4)
b006 = 2
c006 = a006.each_cons(b006).to_a
p c006.class
p c006

p(Nums.new("a", "b", "c", "d").each_cons(2).to_a)

a007 = Nums.new("a", "b", "c", "d")
p a007.class
p a007.each_cons(2).to_a

a008 = Nums.new("a", "b", "c", "d")
b008 = 3
p b008.class
p a008.each_cons(b008).to_a

a009 = Nums.new("a", "b", "c", "d")
b009 = 3
c009 = a009.each_cons(b009).to_a
p c009.class
p c009

p(Nums.new(1, 2, 3, 4).each_cons(2) { |c010| }.class)
c011 = Nums.new(1, 2, 3, 4).each_cons(2) { |c010b| }; p c011.class

# A blockless each_cons on an Array reached through a Hash yields an untyped enumerator.
g96 = { "k" => [1, 2, 3, 4] }
r96 = (g96["k"].each_cons(2).map { |a96, b96| b96 - a96 } rescue $!.class); p r96
r97 = (g96["k"].each_cons(2).to_a rescue $!.class); p r97

# The same untyped enumerator via a Hash-iteration block parameter.
h980 = { "a" => [1, 2, 3] }
r980 = (h980.map { |k980, own980| own980.each_cons(2).map { |x980, y980| y980 - x980 } } rescue $!.class); p r980
