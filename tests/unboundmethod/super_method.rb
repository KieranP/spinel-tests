# frozen_string_literal: true
# UnboundMethod#super_method
class Base
  def foo(a); a; end
end
class Sub < Base
  def foo(a); a + 1; end
end
class Calc
  def add(n); n + 1; end
end

p(Sub.instance_method(:foo).super_method.class)
um001 = Sub.instance_method(:foo); v001 = um001.super_method.class; p v001
p(Calc.instance_method(:add).super_method)
um002 = Calc.instance_method(:add); v002 = um002.super_method; p v002

# super_method through two levels, and the result's name / arity
class L0
  def foo(a); a; end
end
class L1 < L0
  def foo(a); a + 1; end
end
class L2 < L1
  def foo(a); a + 2; end
end
p(L2.instance_method(:foo).super_method.owner)
v010 = L2.instance_method(:foo).super_method.owner; p v010
p(L2.instance_method(:foo).super_method.name)
v011 = L2.instance_method(:foo).super_method.name; p v011
p(L2.instance_method(:foo).super_method.super_method.owner)
v012 = L2.instance_method(:foo).super_method.super_method.owner; p v012
p(L2.instance_method(:foo).super_method.bind(L2.new).call(1))
v013 = L2.instance_method(:foo).super_method.bind(L2.new).call(1); p v013
