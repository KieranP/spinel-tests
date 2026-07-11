# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#itself
p(5.itself)
v043 = 5.itself; p v043
p("x".itself)
v044 = "x".itself; p v044

class Node195
  def initialize; @x = 5; end
  def x; @x; end
end
# itself returns the receiver unchanged (same object)
o045 = Node195.new; p o045.itself.equal?(o045)
o046 = Node195.new; r046 = o046.itself; p r046.equal?(o046)
o047 = Node195.new; p o047.itself.itself.x
o048 = Node195.new; v048 = o048.itself.x; p v048
