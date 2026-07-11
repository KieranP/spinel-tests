class RwDk130
  def deconstruct_keys(keys130) = { kind: :binop, n: 1 }
end
RwDk130.new => { kind: kind130 }
p kind130
RwDk130.new => { kind: kind131, n: n131 }
v131 = [kind131, n131]; p v131
# the same pattern in a case/in binds correctly
case RwDk130.new
in { kind: kind132 } then p kind132
end
# deconstruct_keys, so this form stays commented
r133 = (RwDk130.new in { kind: :binop }); p r133
v134 = (RwDk130.new in { kind: :binop }); p v134

# is a union of two user classes: the else fires and names the class the first pattern gives
class DkNode950
  def deconstruct_keys(keys) = to_h
end
class DkLit950 < DkNode950
  def initialize(v) = @v = v
  def to_h = { kind: :lit, value: @v }
end
class DkCol950 < DkNode950
  def initialize(n) = @n = n
  def to_h = { kind: :col, value: @n }
end
def dkev950(node)
  case node
  in { kind: :lit, value: } then "lit #{value}"
  in { kind: :col, value: } then "col #{value}"
  else raise ArgumentError, "bad node #{node.class}"
  end
end
r950 = (dkev950(DkLit950.new(1)) rescue $!.class); p r950
v951 = (dkev950(DkCol950.new("x")) rescue $!.class); p v951

# Array of keys the pattern names
class Probe960
  attr_reader :seen
  def initialize = @seen = []

  def deconstruct_keys(keys)
    @seen << (keys.nil? ? :all : keys.sort)
    { a: 1, b: 2, c: 3 }
  end
end
probe960 = Probe960.new
case probe960
in { a: } then nil
end
case probe960
in { a:, c: } then nil
end
case probe960
in { **rest960 } then nil
end
p probe960.seen
v961 = probe960.seen; p v961

# binds the inner variable to nil, though the match itself succeeds
class DkNode970
  attr_reader :left
  def initialize(left) = @left = left
  def deconstruct_keys(keys) = { left: @left }
end
class DkLit970
  attr_reader :value
  def initialize(value) = @value = value
  def deconstruct_keys(keys) = { value: @value }
end
DkNode970.new(DkLit970.new(1)) => { left: DkLit970(value: lv970) }
p lv970
DkNode970.new(DkLit970.new(2)) => { left: DkLit970(value: lv971) }
v971 = lv971; p v971
