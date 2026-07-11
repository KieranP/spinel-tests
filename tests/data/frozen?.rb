# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#frozen?
p(Point.new(1, 2).frozen?)
a001 = Point.new(1, 2); p(a001.frozen?)
v001 = Point.new(1, 2).frozen?; p v001
