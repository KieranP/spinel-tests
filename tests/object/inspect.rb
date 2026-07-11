# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#inspect
p(5.inspect)
v030 = 5.inspect; p v030
p("x".inspect)
v031 = "x".inspect; p v031
p([1, 2].inspect)
v032 = [1, 2].inspect; p v032
p((1.0 / 0).inspect)
p((0.0 / 0).inspect)
p((-0.0).inspect)
p((-1.5).inspect)
p(1e20.inspect)
p({ a: [1, "x", :y] }.inspect)
p([nil, true, 1.5].inspect)
p("a\tb\n".inspect)
v034 = (2**70).inspect; p v034
p(Obj195.new.inspect)
a060 = Obj195.new; v033 = a060.inspect; p v033
p(Obj195.new)
a061 = Obj195.new; p a061

class Plain195
  def initialize; @i = 1; @s = "hi"; @a = [1, 2]; end
end
# default inspect: "#<Plain195:0x... @i=1, @s=\"hi\", @a=[1, 2]>" -- check
# structure, never the volatile address
o062 = Plain195.new
p o062.inspect.start_with?("#<Plain195")
v062 = o062.inspect.start_with?("#<Plain195"); p v062
p o062.inspect.include?("@i=1")
p o062.inspect.include?('@s="hi"')
p o062.inspect.include?("@a=[1, 2]")
v063 = o062.inspect.include?("@i=1"); p v063
class Empty195; end
# no ivars: "#<Empty195:0x...>" with no trailing ivar list
o063 = Empty195.new
p o063.inspect.start_with?("#<Empty195")
p o063.inspect.include?("@")
