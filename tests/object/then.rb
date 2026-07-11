# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#then
p(5.then { |x| x + 1 })
v054 = 5.then { |x| x + 1 }; p v054
p(nil.then { |x| x }.inspect)
v055 = nil.then { |x| x }.inspect; p v055

class Amt195
  def initialize(v); @v = v; end
  def v; @v; end
end
# then/yield_self returns the block value (unlike tap)
o056 = Amt195.new(10); p o056.then { |x| x.v * 2 }
o057 = Amt195.new(3); v057 = o057.then { |x| x.v + 1 }; p v057
o058 = Amt195.new(5); p o058.then { |x| x }.equal?(o058)
o059 = Amt195.new(4); p o059.yield_self { |x| x.v * 3 }
o060 = Amt195.new(2); v060 = o060.yield_self { |x| x.v }; p v060
