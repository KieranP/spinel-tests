# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#inspect / Data#to_s
p(Point.new(1, 2).inspect)
v001 = Point.new(1, 2).inspect; p(v001)
p(Point.new(1, 2).to_s)
v002 = Point.new(1, 2).to_s; p(v002)
# a Data instance nested in a container is rendered with the default object format
p([Point.new(1, 2)])
p({ k: Point.new(1, 2) })
v003 = [Point.new(1, 2)].inspect; p(v003)
# a Data value nested as a member renders recursively
Outer = Data.define(:inner, :label)
o004 = Outer.new(Point.new(1, 2), "top")
p(o004)
v004 = o004.inspect; p(v004)
# mixed member types in the inspect string
Mixed = Data.define(:s, :n, :arr)
m005 = Mixed.new("hi", 7, [1, 2])
p(m005)
v005 = m005.to_s; p(v005)
