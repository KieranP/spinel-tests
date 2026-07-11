# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
end

# Object#instance_exec (block form)
p(Obj195.new.instance_exec(3) { |n| @x * n })
a001 = Obj195.new; v001 = a001.instance_exec(2) { |n| @x + n }; p v001
# The block form also works on built-in receivers.
p("ab".instance_exec(2) { |n| self * n })
s001 = "ab"; v002 = s001.instance_exec(2) { |n| self * n }; p v002
p(5.instance_exec(1) { |n| self + n })
p([1, 2].instance_exec { size })
# instance_exec wrapped in a `rescue` modifier whose handler yields a Class:
r001 = ("ab".instance_exec(2) { |n| self * n } rescue $!.class); p r001
