# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#instance_variable_get — members are NOT @ivars in Ruby, so :@x reads back nil ([] from
# instance_variables); Spinel lays members out as @x fields and returns the value.
pt1 = Point.new(1, 2)
p(pt1.instance_variable_get(:@x))
v001 = pt1.instance_variable_get(:@x); p(v001)
