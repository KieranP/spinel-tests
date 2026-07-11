# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#==
p(Point.new(1, 2) == Point.new(1, 2))
a031 = Point.new(1, 2); b031 = Point.new(1, 2); p(a031 == b031)
a032 = Point.new(1, 2); v032 = (a032 == a032); p v032
# Struct instances are not compared by value inside a container
p([Point.new(1, 2)] == [Point.new(1, 2)])
p([Point.new(1, 2)].include?(Point.new(1, 2)))
# Array#index finds a value-equal Struct via ==
p([Point.new(1, 2), Point.new(3, 4), Point.new(5, 6)].index(Point.new(5, 6)))
a033 = [Point.new(1, 2), Point.new(3, 4), Point.new(5, 6)]; v033 = a033.index(Point.new(5, 6)); p v033
