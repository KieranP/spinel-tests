# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#members
p(Point.new(1, 2).members)
v001 = Point.new(1, 2).members; p(v001)

# Data.members (class-level)
p(Point.members)
v002 = Point.members; p(v002)
