# frozen_string_literal: true
class Gp001
  def greet(x = "G"); "G:#{x}"; end
end
class Pa001 < Gp001
  def greet(x = "P"); "P(" + super + ")"; end
end
class Ch001 < Pa001
  def greet(x = "C"); "C(" + super + ")"; end
end

# Class — super dispatch through the ancestor chain
# implicit super (same arguments) down a three-deep chain
p(Ch001.new.greet)
v001 = Ch001.new.greet; p v001
p(Ch001.new.greet("z"))
v002 = Ch001.new.greet("z"); p v002

# explicit-argument super, and the zero-argument super()
class Exp001 < Gp001
  def greet(x = "E"); "E(" + super("given") + ")"; end
end
p(Exp001.new.greet)
v003 = Exp001.new.greet; p v003
class Zero001 < Gp001
  def greet(x = "Z"); "Z(" + super() + ")"; end
end
p(Zero001.new.greet)
v004 = Zero001.new.greet; p v004

# a link that does NOT define the method is skipped
class Mid001 < Gp001; end
class Low001 < Mid001
  def greet(x = "L"); "L(" + super + ")"; end
end
p(Low001.new.greet)
v005 = Low001.new.greet; p v005

# super in initialize, two levels up
class BaseI001
  def initialize(n); @n = n; end
  def n; @n; end
end
class MidI001 < BaseI001
  def initialize(n, m); super(n); @m = m; end
  def m; @m; end
end
class LeafI001 < MidI001
  def initialize; super(1, 2); end
end
o001 = LeafI001.new
p(o001.n)
p(o001.m)
v006 = LeafI001.new; p v006.n

# super from a module method into the class's superclass
module Loud001; def say; "<" + super + ">"; end; end
class Quiet001; def say; "hi"; end; end
class Shout001 < Quiet001; include Loud001; end
p(Shout001.new.say)
v007 = Shout001.new.say; p v007

# super from a prepended module into the class's own method
module Pre001; def say; "[" + super + "]"; end; end
class Wrapped001
  prepend Pre001
  def say; "core"; end
end
p(Wrapped001.new.say)
v008 = Wrapped001.new.say; p v008

# super from a class method
class ClsA001; def self.make; "A"; end; end
class ClsB001 < ClsA001; def self.make; "B(" + super + ")"; end; end
p(ClsB001.make)
v009 = ClsB001.make; p v009

# super carrying the caller's block through to a yielding parent
class Src001; def each2; yield 1; yield 2; end; end
class Wrap001 < Src001; def each2; yield 0; super; end; end
acc001 = []
Wrap001.new.each2 { |e001| acc001 << e001 }
p acc001
acc002 = []; Wrap001.new.each2 { |e002| acc002 << e002 * 10 }; p acc002

# super with keyword arguments, and with a rest parameter
class KwA001; def conf(a:, b: 2); "#{a}-#{b}"; end; end
class KwB001 < KwA001; def conf(a:, b: 9); "K(" + super + ")"; end; end
p(KwB001.new.conf(a: 1))
v010 = KwB001.new.conf(a: 1, b: 5); p v010
class RsA001; def m(*args); args.sum; end; end
class RsB001 < RsA001; def m(*args); super * 2; end; end
p(RsB001.new.m(1, 2, 3))
v011 = RsB001.new.m(4, 5); p v011

# an aliased override still reaches its super
class AlA001 < Gp001
  def greet(x = "A"); "A(" + super + ")"; end
  alias_method :speak, :greet
end
p(AlA001.new.speak)
v012 = AlA001.new.speak; p v012

# super between two modules that both define the method
module Mm001; def who; "M1"; end; end
module Mm002; def who; "M2>" + super; end; end
class Km001; include Mm001; include Mm002; end
p(Km001.new.who)

# included while another class defines the same method name, aborts the C build. Kept
# commented: the build failure takes the whole file down.
module Msup950
  def render950(text) = "#{super}!"
end
class Ksup950
  def render950(text) = text
end
p Ksup950.new.render950("hi")
v950 = Ksup950.new.render950("hi"); p v950
