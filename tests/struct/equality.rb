# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct — equality
p(Point.new(1, 2) == Point.new(1, 2))
v008 = (Point.new(1, 2) == Point.new(1, 2)); p(v008)
p(Point.new(1, 2) == Point.new(1, 3))
v009 = (Point.new(1, 2) == Point.new(1, 3)); p(v009)
