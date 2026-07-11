# frozen_string_literal: true
# UnboundMethod#bind_call
class Cbp
  def a(n) = n + 1
end

# working two-step form: bind(recv).call(*args)
p(Cbp.instance_method(:a).bind(Cbp.new).call(5))
vbp = Cbp.instance_method(:a).bind(Cbp.new).call(5); p vbp

p(Cbp.instance_method(:a).bind_call(Cbp.new, 5))

# bind_call with several arguments, and against two receivers in turn
class Acc010
  def initialize(b); @b = b; end
  def add2(x, y); @b + x + y; end
end
p(Acc010.instance_method(:add2).bind_call(Acc010.new(100), 1, 2))
v010 = Acc010.instance_method(:add2).bind_call(Acc010.new(100), 1, 2); p v010
um011 = Acc010.instance_method(:add2)
p([um011.bind_call(Acc010.new(0), 1, 2), um011.bind_call(Acc010.new(10), 1, 2)])
v011 = um011.bind_call(Acc010.new(1), 1, 2); p v011
# bind_call an UnboundMethod taken from the including class for a module method
module Greet012
  def hi(n); "hi #{n}"; end
end
class Person012
  include Greet012
end
p(Person012.instance_method(:hi).bind_call(Person012.new, "z"))
v012 = Person012.instance_method(:hi).bind_call(Person012.new, "z"); p v012
# the module's own UnboundMethod aborts the C build once a class includes it
p(Greet012.instance_method(:hi).bind_call(Person012.new, "y"))
# the UnboundMethod from Method#unbind cannot be bind_called
um013 = Cbp.new.method(:a).unbind; p(um013.bind_call(Cbp.new, 5))
