# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#instance_of?
p(5.instance_of?(Integer))
v034 = 5.instance_of?(Integer); p v034
p(5.instance_of?(Numeric))
v035 = 5.instance_of?(Numeric); p v035
p("x".instance_of?(String))
v036 = "x".instance_of?(String); p v036
# A ::-scoped class argument on a built-in receiver raises NoMethodError at runtime:
r050 = (5.instance_of?(::Integer) rescue $!.class); p r050

# instance_of? is EXACT class only (unlike is_a?) across an inheritance chain
class Shape195; end
class Circle195 < Shape195; end
c195 = Circle195.new
p(c195.instance_of?(Circle195))
i195 = c195.instance_of?(Circle195); p i195
p(c195.instance_of?(Shape195))
i196 = c195.instance_of?(Shape195); p i196
p(c195.instance_of?(Object))
i197 = c195.instance_of?(Object); p i197
s195 = Shape195.new
p(s195.instance_of?(Shape195))
i198 = s195.instance_of?(Shape195); p i198
