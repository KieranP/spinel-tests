# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#map
Coll141 = Struct.new(:x, :y)
p(Coll141.new(3, 4).map { |v| v * 2 })
v019 = Coll141.new(3, 4).map { |v| v * 2 }; p(v019)
