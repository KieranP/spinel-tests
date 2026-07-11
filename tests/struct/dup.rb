# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#dup
p(Point.new(1, 2).dup.class)
a037 = Point.new(1, 2); b037 = a037.dup; p(b037.class)
a038 = Point.new(1, 2); v038 = a038.dup; p(v038 == a038)
# the copy carries the same member values
p(Point.new(1, 2).dup.to_a)
v039 = Point.new(1, 2).dup; p(v039.x)
# writing through the copy leaves the original alone
a040 = Point.new(1, 2); b040 = a040.dup; b040.x = 9; p([a040.x, b040.x])
a041 = Point.new(1, 2); b041 = a041.dup; b041.y = 8; v041 = [a041.y, b041.y]; p(v041)
# dup of a frozen Struct is not frozen
a042 = Point.new(1, 2).freeze; p(a042.dup.frozen?)
a043 = Point.new(1, 2).freeze; v043 = a043.dup.frozen?; p(v043)
# heterogeneous members survive the copy
Het044 = Struct.new(:i, :s, :arr)
p(Het044.new(1, "hi", [4, 5]).dup.to_a)
v044 = Het044.new(1, "hi", [4, 5]).dup; p(v044.arr)
