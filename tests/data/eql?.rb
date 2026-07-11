# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#eql?
p(Point.new(1, 2).eql?(Point.new(1, 2)))
a001 = Point.new(1, 2); b001 = Point.new(1, 2); v001 = a001.eql?(b001); p v001
p(Point.new(1, 2).eql?(Point.new(1, 3)))
v002 = Point.new(1, 2).eql?(Point.new(1, 3)); p v002
# a Data value is not eql? to a non-Data value
p(Point.new(1, 2).eql?([1, 2]))
v003 = Point.new(1, 2).eql?(nil); p v003
