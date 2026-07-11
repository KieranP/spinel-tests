# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#frozen?
p(Point.new(1, 2).frozen?)
a004 = Point.new(1, 2); p(a004.frozen?)
a005 = Point.new(1, 2); v005 = a005.frozen?; p v005
