# frozen_string_literal: true
# Method#unbind
def dbl(n) = n * 2

class Calc
  def add(n); n + 1; end
end

# unbind returns an UnboundMethod
r001 = (method(:dbl).unbind.class rescue $!.class); p r001
m002 = method(:dbl); r002 = (m002.unbind.class rescue $!.class); p r002
bm003 = Calc.new.method(:add); r003 = (bm003.unbind.class rescue $!.class); p r003

# the UnboundMethod from Method#unbind answers only #class, #name, #original_name, #to_s
um010 = Calc.new.method(:add).unbind
p(um010.class)
v010 = um010.class; p v010
p(um010.name)
v011 = um010.name; p v011
p(um010.original_name)
v012 = um010.original_name; p v012
# rebinding and metadata are refused at compile time
p(um010.bind(Calc.new).call(5))
p(um010.bind_call(Calc.new, 5))
p(um010.arity)
p(um010.owner)
p(um010.parameters)
# the same reads work on the UnboundMethod from Class#instance_method
um013 = Calc.instance_method(:add)
p(um013.bind(Calc.new).call(5))
v013 = um013.bind(Calc.new).call(5); p v013
p(um013.arity); p(um013.owner); p(um013.parameters)
