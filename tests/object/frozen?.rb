# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#frozen?
p("y".frozen?)
p([1, 2].frozen?)
p(5.frozen?)
p(:a.frozen?)
p(nil.frozen?)
a052 = "z"; p a052.frozen?
# a mutable String (from +@) is not frozen
p((+"y").frozen?)
a053 = +"z"; p a053.frozen?
a054 = +"z"; v054 = a054.frozen?; p v054
