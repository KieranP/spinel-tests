# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#each_entry
Nums.new(3, 1, 2).each_entry { |x| p x }

a001 = n
p a001.class
a001.each_entry { |x| p x }

a002 = Nums.new(3, 1, 2)
c002 = a002.each_entry { |x| p x }
p c002.class
p c002.equal?(a002)

Nums.new(1.5, 2.5, 3.5).each_entry { |x| p x }

a003 = Nums.new(1.5, 2.5, 3.5)
c003 = a003.each_entry { |x| p x }
p c003.class

Nums.new("a", "b", "c").each_entry { |x| p x }

a004 = Nums.new("a", "b", "c")
c004 = a004.each_entry { |x| p x }
p c004.class

# On a Hash returned by a seedless Array#reduce.
a82ee = { n: 1, s: { x: 2 } }
h82ee = [a82ee].reduce { |acc82ee, l82ee| acc82ee }
r82ee = (h82ee.each_entry { |x82ee| }.class rescue $!.class); p r82ee

# Enumerable#each_entry on a user #each that yields TWO values per element packs them into
# an Array in CRuby; Spinel yields them spread, as #each does.
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Enumerable#each_entry on a user class whose #each yields MULTIPLE values"
# class PairsE; include Enumerable; def each; yield :a, 1; yield :b, 2; end; end
# PairsE.new.each_entry { |e401| p e401 }
# c402 = PairsE.new.each_entry { |e402| p e402 }; p c402.class

# Enumerable#each_entry over an empty and a single-element user #each
class CondE
  include Enumerable
  def initialize(xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end
CondE.new([]).each_entry { |x403| p x403 }
c404 = CondE.new([7]).each_entry { |x404| p x404 }; p c404.class
