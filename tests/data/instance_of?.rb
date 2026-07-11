# frozen_string_literal: true
Point = Data.define(:x, :y)
Other = Data.define(:x, :y)

# Data#instance_of?
p(Point.new(1, 2).instance_of?(Point))
v001 = Point.new(1, 2).instance_of?(Point); p v001
p(Point.new(1, 2).instance_of?(Other))
v002 = Point.new(1, 2).instance_of?(Other); p v002
p(Point.new(1, 2).instance_of?(Object))
a003 = Point.new(1, 2); p(a003.instance_of?(Point))
# the value produced by #with, and one read back out of a container
p(Point.new(1, 2).with(x: 9).instance_of?(Point))
arr004 = [Point.new(1, 2)]
v004 = arr004.first.instance_of?(Point); p v004
