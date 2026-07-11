# frozen_string_literal: true
# UnboundMethod#name
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).name)
um001 = Calc.instance_method(:add); v001 = um001.name; p v001

# name of an UnboundMethod taken from an included module and from a superclass
module Greet010
  def hi(n); "hi #{n}"; end
end
class Person010
  include Greet010
end
p(Person010.instance_method(:hi).name)
v010 = Person010.instance_method(:hi).name; p v010
class Base011
  def foo(n); n; end
end
class Sub011 < Base011; end
p(Sub011.instance_method(:foo).name)
v011 = Sub011.instance_method(:foo).name; p v011
# the module's own UnboundMethod aborts the C build once a class includes it
um012 = Greet010.instance_method(:hi); p(um012.name)
