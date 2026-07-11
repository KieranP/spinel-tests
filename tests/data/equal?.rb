# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#equal?
a001 = Point.new(1, 2)
p(a001.equal?(a001))
v001 = a001.equal?(a001); p v001
p(a001.equal?(Point.new(1, 2)))
v002 = a001.equal?(Point.new(1, 2)); p v002
