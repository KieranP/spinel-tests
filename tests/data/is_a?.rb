# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#is_a?
p(Point.new(1, 2).is_a?(Point))
v001 = Point.new(1, 2).is_a?(Point); p v001
p(Point.new(1, 2).is_a?(Object))
p(Point.new(1, 2).is_a?(String))
v002 = Point.new(1, 2).is_a?(String); p v002
p(Point.new(1, 2).instance_of?(Point))
# a Data instance is a kind of Data
p(Point.new(1, 2).is_a?(Data))
a003 = Point.new(1, 2); p(a003.is_a?(Data))
v003 = Point.new(1, 2).is_a?(Data); p v003
