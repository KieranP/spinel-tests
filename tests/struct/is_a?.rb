# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#is_a?
p(Point.new(1, 2).is_a?(Point))
p(Point.new(1, 2).is_a?(Object))
p(Point.new(1, 2).is_a?(String))
a014 = Point.new(1, 2); p(a014.is_a?(Point))
a015 = Point.new(1, 2); v015 = a015.is_a?(String); p v015
