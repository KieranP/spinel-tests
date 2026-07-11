# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#hash
p(Point.new(1, 2).hash == Point.new(1, 2).hash)
v001 = (Point.new(1, 2).hash == Point.new(1, 2).hash); p v001
p(Point.new(1, 2).hash.is_a?(Integer))
v002 = Point.new(1, 2).hash.is_a?(Integer); p v002
# a Data instance as a Hash key is not matched by value
p({ Point.new(1, 2) => "a" }[Point.new(1, 2)])
h003 = { Point.new(1, 2) => "a" }; p(h003[Point.new(1, 2)])
