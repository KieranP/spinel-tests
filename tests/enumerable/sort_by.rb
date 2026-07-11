# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#sort_by
p(Nums.new(3, 1, 2).sort_by { |x| -x })

a001 = n
p a001.class
p a001.sort_by { |x| -x }

a002 = Nums.new(3, 1, 2)
c002 = a002.sort_by { |x| -x }
p c002.class
p c002

p(Nums.new(3.5, 1.5, 2.5).sort_by { |x| -x })

a003 = Nums.new(3.5, 1.5, 2.5)
p a003.class
p a003.sort_by { |x| -x }

a004 = Nums.new(3.5, 1.5, 2.5)
c004 = a004.sort_by { |x| -x }
p c004.class
p c004

p(Nums.new("ccc", "a", "bb").sort_by { |x| x.length })

a005 = Nums.new("ccc", "a", "bb")
p a005.class
p a005.sort_by { |x| x.length }

a006 = Nums.new("ccc", "a", "bb")
c006 = a006.sort_by { |x| x.length }
p c006.class
p c006

c392 = Hash.new(0); c392["the"] = 3; c392["dog"] = 1
r392 = c392.sort_by { |w392, n392| [-n392, w392] }
v392 = (r392.first(2).map { |w392b, n392b| "#{w392b}:#{n392b}" } rescue $!.class); p v392

# Enumerable#sort_by over Time elements: silently returns nil elements under Spinel
a122 = [Time.new(2026, 1, 2), Time.new(2026, 1, 1)]
r122 = (a122.sort_by { |t122| t122 }.map(&:day) rescue $!.class); p r122

# sort_by with a symbol-proc naming a method the element lacks aborts the build.
r96sort_by = ([1, 2].sort_by(&:foo96) rescue $!.class); p r96sort_by
# map / each with the same symbol-proc raise NoMethodError at run time, as in Ruby
r97sort_by = ([1, 2].map(&:foo96) rescue $!.class); p r97sort_by

# Blockless Enumerable#sort_by on a user class returns an Enumerator
r401sort_by = (Nums.new(1, 2, 3).sort_by.class rescue $!.class); p r401sort_by
