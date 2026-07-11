# frozen_string_literal: true
class C001
  def a; 1; end
  alias_method :b, :a
end

# Class#alias_method (declarative, in class body)
o001 = C001.new
p(o001.b)
v001 = o001.b; p v001
p(o001.a == o001.b)
v002 = (o001.a == o001.b); p v002

# an alias of an INHERITED method
class Up001; def greet; "up"; end; end
class Down001 < Up001; alias_method :greet2, :greet; end
p(Down001.new.greet2)
v003 = Down001.new.greet2; p v003
p(Down001.new.greet)

# aliasing a method that takes arguments and a block
class Args001
  def combine(a, b); a + b; end
  alias_method :plus, :combine
  def each2; yield 1; yield 2; end
  alias_method :walk, :each2
end
p(Args001.new.plus(2, 3))
v004 = Args001.new.plus(4, 5); p v004
acc001 = []; Args001.new.walk { |e001| acc001 << e001 }; p acc001

# an alias taken BEFORE the method is redefined must keep the original body
class Redef001
  def greet; "orig"; end
  alias_method :old_greet, :greet
  def greet; "new"; end
end
p(Redef001.new.greet)
p(Redef001.new.old_greet)
v005 = Redef001.new.old_greet; p v005

# the same across an inheritance boundary
class Par001; def greet; "parent"; end; end
class Kid001 < Par001
  alias_method :super_greet, :greet
  def greet; "kid"; end
end
p(Kid001.new.greet)
p(Kid001.new.super_greet)
v006 = Kid001.new.super_greet; p v006

# the wrapping idiom: the redefinition calls the alias
class Wrap001
  def greet; "core"; end
  alias_method :old, :greet
  def greet; "wrap(" + old + ")"; end
end
p(Wrap001.new.greet)
v007 = Wrap001.new.greet; p v007
