# frozen_string_literal: true
# UnboundMethod#bind
class Calc
  def initialize(base); @base = base; end
  def add(n); @base + n; end
end

# instance_method(...).bind(obj).call(arg), literal chain and via a variable
p(Calc.instance_method(:add).bind(Calc.new(1)).call(2))
um001 = Calc.instance_method(:add); v001 = um001.bind(Calc.new(1)).call(2); p v001

# rescue-probe form (in case bind/call is unsupported on a given build)
r002 = (Calc.instance_method(:add).bind(Calc.new(10)).call(5) rescue $!.class); p r002
um003 = Calc.instance_method(:add); r003 = (um003.bind(Calc.new(10)).call(5) rescue $!.class); p r003

# bind an UnboundMethod taken from a module the receiver's class includes
module Greet010
  def hi(n); "hi #{n}"; end
end
class Person010
  include Greet010
end
p(Person010.instance_method(:hi).bind(Person010.new).call("z"))
v010 = Person010.instance_method(:hi).bind(Person010.new).call("z"); p v010
# the module's own UnboundMethod aborts the C build once a class includes it
p(Greet010.instance_method(:hi).bind(Person010.new).call("x"))
um011 = Greet010.instance_method(:hi); p(um011.bind(Person010.new).call("x"))
# the UnboundMethod from Method#unbind cannot be rebound
um012 = Calc.new(1).method(:add).unbind; p(um012.bind(Calc.new(10)).call(5))
# bind then call the same UnboundMethod against two different receivers
um013 = Calc.instance_method(:add)
p([um013.bind(Calc.new(1)).call(1), um013.bind(Calc.new(100)).call(1)])
v013 = um013.bind(Calc.new(5)).call(5); p v013
# binding a superclass's UnboundMethod to a subclass instance
class Base014
  def foo(n); n * 2; end
end
class Sub014 < Base014; end
p(Base014.instance_method(:foo).bind(Sub014.new).call(3))
v014 = Base014.instance_method(:foo).bind(Sub014.new).call(3); p v014
