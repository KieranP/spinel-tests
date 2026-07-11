# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#class
p(Point.new(1, 2).class)
a001 = Point.new(1, 2); p(a001.class)
a002 = Point.new(1, 2); v002 = a002.class; p v002

# Point.class
p(Point.class)
v003 = Point.class; p v003
SCN050 = Struct.new(:a, :b)
p(SCN050.new(1, 2).class.new(9, 2))
v051 = SCN050.new(1, 2).class.new(9, 2); p v051
p(SCN050.new(1, 2).class.new(9, 2).to_a)
SCN052 = Struct.new(:a, :b, keyword_init: true)
p(SCN052.new(a: 1, b: 2).class.new(a: 9, b: 2))
v053 = SCN052.new(a: 1, b: 2).class; p v053.new(a: 9, b: 2)
