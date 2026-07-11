# frozen_string_literal: true
class Vec001
  attr_reader :x
  def initialize(x); @x = x; end
  def +(o); Vec001.new(x + o.x); end
  def -(o); Vec001.new(x - o.x); end
  def -@; Vec001.new(-x); end
  def +@; self; end
  def [](i); x + i; end
  def []=(i, v); @x = i + v; end
  def <<(v); @x += v; self; end
  def ==(o); o.is_a?(Vec001) && x == o.x; end
  def <=>(o); x <=> o.x; end
  def to_s; "V#{x}"; end
  def inspect; "#<V #{x}>"; end
  def call(a); "called #{a}"; end
  def each; yield x; yield x + 1; self; end
end

# Class — operator methods defined on a user class, called through the natural syntax
a001 = Vec001.new(1); b001 = Vec001.new(2)
p((a001 + b001).x)
v001 = a001 + b001; p v001.x
p((a001 - b001).x)
v002 = a001 - b001; p v002.x
p((-a001).x)
v004 = -a001; p v004.x
p((+a001).x)
p(a001[10])
v005 = a001[10]; p v005
c001 = Vec001.new(1); c001[3] = 4; p c001.x
d001 = Vec001.new(1); d001 << 5; p d001.x
e001 = Vec001.new(1); v006 = (e001 << 2); p v006.x

# equality, ordering, and the Array/Hash protocols that lean on them
p(a001 == Vec001.new(1))
v007 = (a001 == b001); p v007
p((a001 <=> b001))
v008 = (a001 <=> b001); p v008
p([Vec001.new(3), Vec001.new(1), Vec001.new(2)].sort.map { |q001| q001.x })
v009 = [Vec001.new(3), Vec001.new(1)].sort; p v009.map { |q002| q002.x }
p([Vec001.new(3), Vec001.new(1)].max.x)
p([Vec001.new(3), Vec001.new(1)].min.x)
p([Vec001.new(1), Vec001.new(2)].include?(Vec001.new(2)))
v010 = [Vec001.new(1), Vec001.new(1)].uniq; p v010.size
p([Vec001.new(1), Vec001.new(2)].index(Vec001.new(2)))

# to_s / inspect picked up by interpolation, puts and p
p("#{a001}")
v011 = "val=#{b001}"; p v011
p(a001)
puts a001
v012 = a001.inspect; p v012

# #call reached through .() and #each reached by a block
p(a001.call(7))
v013 = a001.(8); p v013
acc001 = []; a001.each { |n001| acc001 << n001 }; p acc001
v014 = []; b001.each { |n002| v014 << n002 * 10 }; p v014

# A scalar `#*` on Vec001, alongside its `#+` and `#<<` and the `#to_proc` below,
# aborts this file's build with a mistyped `@x += v` parameter:
  def *(n); Vec001.new(x * n); end

# #to_proc reached through &
class Times001
  def initialize(n); @n = n; end
  def to_proc; ->(v) { v * @n }; end
end
p([1, 2, 3].map(&Times001.new(3)))
v015 = [1, 2].map(&Times001.new(10)); p v015

# Comparable's operators come from <=>, but CRuby needs the mixin as well
class Cmp001
  include Comparable
  attr_reader :x
  def initialize(x); @x = x; end
  def <=>(o); x <=> o.x; end
end
p(Cmp001.new(1) < Cmp001.new(2))
v016 = (Cmp001.new(3) >= Cmp001.new(2)); p v016
p(Cmp001.new(2).between?(Cmp001.new(1), Cmp001.new(3)))
p(Cmp001.new(5).clamp(Cmp001.new(1), Cmp001.new(3)).x)

# The numeric coercion protocol: a #coerce that hands back a freshly built
# receiver, alongside a #+.
class Cel001
  attr_reader :d
  def initialize(d); @d = d; end
  def +(o); Cel001.new(d + o.d); end
  def bump(n); @d += n; self; end
  def coerce(n); [Cel001.new(n), self]; end
end
p(Cel001.new(1).bump(5).d)
p((Cel001.new(1) + Cel001.new(2)).d)
v017 = (2 + Cel001.new(3)); p v017.d
