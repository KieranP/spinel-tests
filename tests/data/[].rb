# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data.[]
p(Point[1, 2])
v001 = Point[1, 2]; p(v001)
p(Point[x: 3, y: 4])
v002 = Point[x: 3, y: 4]; p(v002)
