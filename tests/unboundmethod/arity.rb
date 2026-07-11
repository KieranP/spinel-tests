# frozen_string_literal: true
# UnboundMethod#arity
class Calc
  def add(n); n + 1; end
  def none; 0; end
end

p(Calc.instance_method(:add).arity)
um001 = Calc.instance_method(:add); v001 = um001.arity; p v001

p(Calc.instance_method(:none).arity)
um002 = Calc.instance_method(:none); v002 = um002.arity; p v002

# arity across parameter shapes
class Shapes010
  def opt(a, b = 1); a; end
  def rest(*a); a.size; end
  def kw(a, k: 1); a; end
  def kwreq(a, k:); a; end
  def blk(&b); 0; end
end
p(Shapes010.instance_method(:opt).arity)
v010 = Shapes010.instance_method(:opt).arity; p v010
p(Shapes010.instance_method(:rest).arity)
v011 = Shapes010.instance_method(:rest).arity; p v011
p(Shapes010.instance_method(:kw).arity)
v012 = Shapes010.instance_method(:kw).arity; p v012
p(Shapes010.instance_method(:kwreq).arity)
v013 = Shapes010.instance_method(:kwreq).arity; p v013
p(Shapes010.instance_method(:blk).arity)
v014 = Shapes010.instance_method(:blk).arity; p v014
# an UnboundMethod taken from a module that a class includes aborts the C build
module Greet015
  def hi(n); "hi #{n}"; end
end
class Person015
  include Greet015
end
um015 = Greet015.instance_method(:hi); p(um015.arity)
p(Greet015.instance_method(:hi).arity)
p(Person015.instance_method(:hi).arity)
# arity of the UnboundMethod from Method#unbind is refused at compile time
um016 = Calc.new.method(:add).unbind; p(um016.arity)
