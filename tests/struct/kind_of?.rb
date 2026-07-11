# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#kind_of?
p(Point.new(1, 2).kind_of?(Point))
p(Point.new(1, 2).kind_of?(Object))
p(Point.new(1, 2).kind_of?(String))
a016 = Point.new(1, 2); p(a016.kind_of?(Point))
a017 = Point.new(1, 2); v017 = a017.kind_of?(String); p v017
