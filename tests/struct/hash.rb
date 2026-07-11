# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#hash
H226 = Struct.new(:x, :y)
p(H226.new(1, 2).hash.is_a?(Integer))
a226 = H226.new(1, 2).hash; p(a226.is_a?(Integer))
# a Struct instance as a Hash key is not matched by value
p({ Point.new(1, 2) => "s" }[Point.new(1, 2)])
h227 = { Point.new(1, 2) => "s" }; p(h227[Point.new(1, 2)])
