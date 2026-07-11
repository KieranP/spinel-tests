# frozen_string_literal: true
Point = Data.define(:x, :y)
Other = Data.define(:x, :y)
Box = Data.define(:m)

# Data#==
p(Point.new(1, 2) == Point.new(1, 2))
a001 = Point.new(1, 2); b001 = Point.new(1, 2); v001 = (a001 == b001); p v001
p(Point.new(1, 2) == Point.new(1, 3))
v002 = (Point.new(1, 2) == Point.new(1, 3)); p v002
# a different Data class with the same members is not equal
p(Point.new(1, 2) == Other.new(1, 2))
v003 = (Point.new(1, 2) == Other.new(1, 2)); p v003
# Data instances are not compared by value inside containers or as a nested member
p([Point.new(1, 2)] == [Point.new(1, 2)])
p([Point.new(1, 2)].include?(Point.new(1, 2)))
p({ k: Point.new(1, 2) } == { k: Point.new(1, 2) })
p(Box.new(Point.new(1, 2)) == Box.new(Point.new(1, 2)))
v004 = ([Point.new(1, 2)] == [Point.new(1, 2)]); p v004
# comparison against non-Data values is false, never an error
p(Point.new(1, 2) == nil)
p(Point.new(1, 2) == 5)
v005 = (Point.new(1, 2) == "str"); p v005
# nested-Data equality compares members by value
Outer = Data.define(:inner, :label)
p(Outer.new(Point.new(1, 2), "t") == Outer.new(Point.new(1, 2), "t"))
p(Outer.new(Point.new(1, 2), "t") == Outer.new(Point.new(9, 9), "t"))
v006 = (Outer.new(Point.new(1, 2), "t") == Outer.new(Point.new(1, 2), "t")); p v006
