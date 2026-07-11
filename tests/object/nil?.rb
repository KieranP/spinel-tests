# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#nil?
p(nil.nil?)
v048 = nil.nil?; p v048
p(5.nil?)
v049 = 5.nil?; p v049
p("x".nil?)
v050 = "x".nil?; p v050
