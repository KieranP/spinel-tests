# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#object_id
p(Point.new(1, 2).object_id.is_a?(Integer))
a024 = Point.new(1, 2); p(a024.object_id == a024.object_id)
a025 = Point.new(1, 2); v025 = (a025.object_id.is_a?(Integer)); p v025
