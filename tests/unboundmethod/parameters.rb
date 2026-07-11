# frozen_string_literal: true
# UnboundMethod#parameters
module Greeter
  def hello(name, greeting = "hi", *rest, key:, **opts, &blk); "#{greeting} #{name}"; end
end
class Calc
  def add(n); n + 1; end
end

p(Calc.instance_method(:add).parameters)
um001 = Calc.instance_method(:add); v001 = um001.parameters; p v001
p(Greeter.instance_method(:hello).parameters)
um002 = Greeter.instance_method(:hello); v002 = um002.parameters; p v002

# parameters across the remaining shapes
class Shapes010
  def none; 0; end
  def opt(a, b = 1); a; end
  def rest(*a); a.size; end
  def kwrest(**kw); kw.size; end
  def blk(&b); 0; end
end
p(Shapes010.instance_method(:none).parameters)
v010 = Shapes010.instance_method(:none).parameters; p v010
p(Shapes010.instance_method(:opt).parameters)
v011 = Shapes010.instance_method(:opt).parameters; p v011
p(Shapes010.instance_method(:rest).parameters)
v012 = Shapes010.instance_method(:rest).parameters; p v012
p(Shapes010.instance_method(:kwrest).parameters)
v013 = Shapes010.instance_method(:kwrest).parameters; p v013
p(Shapes010.instance_method(:blk).parameters)
v014 = Shapes010.instance_method(:blk).parameters; p v014
# an UnboundMethod taken from a module that a class includes aborts the C build
module Greet015
  def hi(n, o = 1); "hi #{n}#{o}"; end
end
class Person015
  include Greet015
end
um015 = Greet015.instance_method(:hi); p(um015.parameters)
p(Person015.instance_method(:hi).parameters)
# parameters of the UnboundMethod from Method#unbind is refused at compile time
um016 = Calc.new.method(:add).unbind; p(um016.parameters)
