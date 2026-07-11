# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#to_s
p(Point.new(1, 2).to_s)
a035 = Point.new(1, 2); p(a035.to_s)
a036 = Point.new(1, 2); v036 = a036.to_s; p v036
