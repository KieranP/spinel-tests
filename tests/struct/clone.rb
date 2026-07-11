# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#clone
p(Point.new(1, 2).clone.class)
c1 = Point.new(1, 2).clone; p(c1.class)
c2 = Point.new(1, 2); c3 = c2.clone; p(c3 == c2)
# the copy carries the same member values
p(Point.new(1, 2).clone.to_a)
c4 = Point.new(1, 2).clone; p(c4.y)
# writing through the copy leaves the original alone
c5 = Point.new(1, 2); c6 = c5.clone; c6.x = 9; p([c5.x, c6.x])
c7 = Point.new(1, 2); c8 = c7.clone; c8.y = 8; v8 = [c7.y, c8.y]; p(v8)
# clone of an unfrozen Struct is unfrozen, and clone(freeze: false) unfreezes
p(Point.new(1, 2).clone.frozen?)
c9 = Point.new(1, 2).freeze; p(c9.clone(freeze: false).frozen?)
c10 = Point.new(1, 2).freeze; v10 = c10.clone(freeze: false).frozen?; p(v10)
# heterogeneous members survive the copy
Het11 = Struct.new(:i, :s, :arr)
p(Het11.new(1, "hi", [4, 5]).clone.to_a)
v11 = Het11.new(1, "hi", [4, 5]).clone; p(v11.s)
