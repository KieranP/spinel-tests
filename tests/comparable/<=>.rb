# frozen_string_literal: true
# Comparable#<=>
class ShapeC
  include Comparable
  def <=>(o) = area <=> o.area
end
class RectC < ShapeC
  def initialize(s) = @s = s
  def area = @s * @s
end
class CircC < ShapeC
  def initialize(r) = @r = r
  def area = @r * @r * 3.14
end

p(RectC.new(4) > RectC.new(2))
rsp = ((RectC.new(3) <=> CircC.new(2)) rescue $!.class); p rsp
