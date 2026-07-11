# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data — class ancestry
p(Point.ancestors)
v001 = Point.ancestors; p(v001)
p(Point.ancestors.include?(Object))
# Data appears in the printed ancestor list, but include?(Data) is false
p(Point.ancestors.include?(Data))
v002 = Point.ancestors.include?(Data); p v002
# a class-ordering comparison against Data aborts compilation
r003 = (Point < Data); p r003
