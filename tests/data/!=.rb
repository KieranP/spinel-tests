# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#!=
p(Point.new(1, 2) != Point.new(1, 2))
a001 = Point.new(1, 2); b001 = Point.new(1, 2); v001 = (a001 != b001); p v001
p(Point.new(1, 2) != Point.new(3, 4))
v002 = (Point.new(1, 2) != Point.new(3, 4)); p v002
