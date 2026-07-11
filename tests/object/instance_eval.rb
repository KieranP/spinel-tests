# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def dbl; @x * 2; end
end

# Object#instance_eval (block form)
p(Obj195.new.instance_eval { @x })
a130 = Obj195.new; v130 = a130.instance_eval { @x }; p v130
p(Obj195.new.instance_eval { dbl })
# The block form also works on built-in receivers.
p("abc".instance_eval { upcase })
s130 = "abc"; v131 = s130.instance_eval { upcase }; p v131
p(5.instance_eval { self + 1 })
p([1, 2].instance_eval { size })
# instance_eval wrapped in a `rescue` modifier whose handler yields a Class:
r131 = ("abc".instance_eval { upcase } rescue $!.class); p r131
