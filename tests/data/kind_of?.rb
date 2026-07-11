# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#kind_of?
p(Point.new(1, 2).kind_of?(Point))
v001 = Point.new(1, 2).kind_of?(Point); p v001
p(Point.new(1, 2).kind_of?(Object))
p(Point.new(1, 2).kind_of?(String))
v002 = Point.new(1, 2).kind_of?(String); p v002
# a Data instance is a kind of Data (same root as is_a?)
p(Point.new(1, 2).kind_of?(Data))
v003 = Point.new(1, 2).kind_of?(Data); p v003
