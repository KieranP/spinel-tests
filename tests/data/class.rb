# frozen_string_literal: true
Point = Data.define(:x, :y)

# Point#class
p(Point.new(1, 2).class)
a001 = Point.new(1, 2); p(a001.class)
a002 = Point.new(1, 2); v002 = a002.class; p v002
# the class of a value produced by #with is the same class
p(Point.new(1, 2).with(x: 9).class)
v003 = Point.new(1, 2).with(x: 9).class; p v003
# an element read back out of a container keeps its class
arr004 = [Point.new(1, 2)]
p(arr004.first.class)
v004 = arr004[0].class; p v004

# Point.class
p(Point.class)
v005 = Point.class; p v005
DCN050 = Data.define(:a)
p(DCN050.new(a: 1).class.new(a: 9))
v051 = DCN050.new(a: 1).class.new(a: 9); p v051
