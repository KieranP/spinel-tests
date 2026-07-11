# frozen_string_literal: true
class Ver
  include Comparable
  attr_reader :n
  def initialize(n); @n = n; end
  def <=>(o); n <=> o.n; end
end

a = Ver.new(5); b = Ver.new(9)

# Comparable#sort (uses <=>)
p([Ver.new(3), Ver.new(1), Ver.new(2)].sort.map(&:n))

a001 = [Ver.new(3), Ver.new(1), Ver.new(2)]
p a001.class
p(a001.sort.map(&:n))

a003 = [Ver.new(3), Ver.new(1), Ver.new(2)]
c003 = a003.sort.map(&:n)
p c003.class
p c003

p([Ver.new(9), Ver.new(5), Ver.new(7), Ver.new(1)].sort.map(&:n))

a001 = [Ver.new(9), Ver.new(5), Ver.new(7), Ver.new(1)]
p a001.class
p(a001.sort.map(&:n))

a003 = [Ver.new(9), Ver.new(5), Ver.new(7), Ver.new(1)]
c003 = a003.sort.map(&:n)
p c003.class
p c003

p([Ver.new(2), Ver.new(2), Ver.new(1)].sort.map(&:n))

a001 = [Ver.new(2), Ver.new(2), Ver.new(1)]
p a001.class
p(a001.sort.map(&:n))

a003 = [Ver.new(2), Ver.new(2), Ver.new(1)]
c003 = a003.sort.map(&:n)
p c003.class
p c003

class Shape126; include Comparable; def area; 0; end; def <=>(o); area <=> o.area; end; end
class Rect126 < Shape126; def initialize(w, h); @w = w; @h = h; end; def area; @w * @h; end; end
class Sq126 < Rect126; def initialize(s); super(s, s); end; end
p(Sq126.new(4) > Rect126.new(2, 3))
r126 = ([Rect126.new(3, 4), Sq126.new(5)].sort.map(&:area) rescue $!.class); p r126

class Shape145; include Comparable; def area; 0; end; def <=>(o); area <=> o.area; end; end
class Rect145 < Shape145; def initialize(a); @a = a; end; def area; @a; end; end
class Circ145 < Shape145; def initialize(a); @a = a; end; def area; @a; end; end
Rect145.new(4) > Rect145.new(2)
r145 = ([Rect145.new(3), Circ145.new(1)].sort.map(&:area) rescue $!.class); p r145

# An Array of user Comparables flowing through a pipeline and back out of containers
class Item401
  include Comparable
  attr_reader :name, :price
  def initialize(name, price); @name = name; @price = price; end
  def <=>(o); price <=> o.price; end
end
items401 = [Item401.new("a", 30), Item401.new("b", 10), Item401.new("c", 20)]
p(items401.sort.map(&:name))
p(items401.minmax.map(&:name))
p(items401.group_by { |i401| i401.price > 15 }.transform_values { |v401| v401.map(&:name) })
p(items401.partition { |i402| i402 > items401[1] }.map { |g402| g402.map(&:name) })
h403 = items401.to_h { |i403| [i403.name, i403] }
p(h403["a"].price)
p(h403.values.sort.map(&:name))
c404 = items401.sort.map(&:price); p c404
c405 = items401.max_by(2, &:price).map(&:name); p c405

# Comparable#sort reached through a module that itself includes Comparable
module Sizeable406
  include Comparable
  def <=>(o); sv <=> o.sv; end
end
class Box406
  include Sizeable406
  attr_reader :sv
  def initialize(n); @sv = n; end
end
p([Box406.new(3), Box406.new(1)].sort.map(&:sv))
c407 = [Box406.new(3), Box406.new(1)].sort.map(&:sv); p c407
