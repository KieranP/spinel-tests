# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#yield_self
p(5.yield_self { |x| x * 2 })
v059 = 5.yield_self { |x| x * 2 }; p v059

class Wrap195
  def initialize(v); @v = v; end
  def v; @v; end
end
# yield_self returns the block value through a user object
o060 = Wrap195.new(4); p o060.yield_self { |x| x.v + 1 }
o061 = Wrap195.new(6); v061 = o061.yield_self { |x| x.v * 2 }; p v061
o062 = Wrap195.new(3); p o062.yield_self { |x| x }.equal?(o062)
