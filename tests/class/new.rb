# frozen_string_literal: true
class Point001
  def initialize(x); @x = x; end
  def to_s; "P(#{@x})"; end
end
class Empty001
  def to_s; "empty"; end
end

# Class#new
p(String.new)
v001 = String.new; p v001
p(String.new("hi"))
v002 = String.new("hi"); p v002
p(Array.new(3, 0))
v003 = Array.new(3, 0); p v003
p(Object.new.class)
v004 = Object.new; p v004.class
p(Point001.new(5).to_s)
v005 = Point001.new(5); p v005.to_s
# no-arg new through a variable-held class reference works
e001 = Empty001
p(e001.new.to_s)
v006 = e001.new; p v006.to_s
# new with an argument through a variable-held class reference:
# user class -> C compile abort; builtin -> unsupported reject
pt001 = Point001
p(pt001.new(7).to_s)
v007 = pt001.new(7); p v007.to_s
a001 = 7
p(pt001.new(a001).to_s)
k001 = Array
p(k001.new(3, 0))
reg611 = { "p" => Point001 }
v611 = (reg611["p"].new(9).to_s rescue $!.class); p v611

module Fac800; def create(a, b); new(a, b); end; end
class Prod800; extend Fac800; def initialize(a, b); @a = a; @b = b; end; def a; @a; end; end
p Prod800.create(1, 2).a

# Building a class at run time is unsupported. The parenthesized forms are
# rejected cleanly at compile time; a bare `Class.new` builds but the object it
# returns has no methods, so any call on it is a runtime NoMethodError.
# WONTFIX: See docs/limitations.md - "Fundamental limits — Class.new(parent) { ... } (runtime class)"
# p(Class.new(String).superclass)
# WONTFIX: See docs/limitations.md - "Fundamental limits — Class.new(parent) { ... } (runtime class)"
# k002 = Class.new { def hi; 1; end }; p k002.new.hi
# WONTFIX: See docs/limitations.md - "Fundamental limits — Class.new(parent) { ... } (runtime class)"
# p(Class.new.class)
# WONTFIX: See docs/limitations.md - "Fundamental limits — Class.new(parent) { ... } (runtime class)"
# p(Module.new.name)

# module's initialize that is never emitted, so the link fails; kept commented
module Counted900
  def initialize
    @n900 = 7
  end
  def n900 = @n900
end
class Plain900
  def n900 = 0
end
class Counted901
  include Counted900
end
p Counted901.new.n900
p([Plain900, Counted901].map { |k900| k900.new.n900 })
v901 = [Plain900, Counted901].map { |k901| k901.new.n900 }; p v901

# empty: the default is used in place of the argument
class Quant950
  attr_reader :units
  def initialize(units = {})
    @units = {}
    units.each { |u950, e950| @units[u950] = e950 }
  end
end
KILO950 = { 'kg' => 1 }
p Quant950.new(KILO950).units
v951 = Quant950.new(KILO950).units; p v951
