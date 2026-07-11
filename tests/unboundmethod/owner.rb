# frozen_string_literal: true
# UnboundMethod#owner
module Greeter
  def hi; "hi"; end
end
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).owner)
um001 = Calc.instance_method(:add); v001 = um001.owner; p v001

p(Greeter.instance_method(:hi).owner)
um002 = Greeter.instance_method(:hi); v002 = um002.owner; p v002

# owner of an UnboundMethod taken from the class that INCLUDES a module names the class
module Greet010
  def hi(n); "hi #{n}"; end
end
class Person010
  include Greet010
end
p(Person010.instance_method(:hi).owner)
um010 = Person010.instance_method(:hi); v010 = um010.owner; p v010
# the module's own UnboundMethod aborts the C build once a class includes it
p(Greet010.instance_method(:hi).owner)
um011 = Greet010.instance_method(:hi); p(um011.owner)
# owner of an inherited method names the defining superclass
class Base012
  def foo(n); n; end
end
class Sub012 < Base012
  def bar(n); n; end
end
p(Sub012.instance_method(:foo).owner)
v012 = Sub012.instance_method(:foo).owner; p v012
p(Sub012.instance_method(:bar).owner)
v013 = Sub012.instance_method(:bar).owner; p v013
