# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#eql?
p(Point.new(1, 2).eql?(Point.new(1, 2)))
a029 = Point.new(1, 2); b029 = Point.new(1, 2); p(a029.eql?(b029))
a030 = Point.new(1, 2); v030 = a030.eql?(a030); p v030
# Array#uniq deduplicates value-equal Structs via eql?/hash
p([Point.new(1, 2), Point.new(3, 4), Point.new(1, 2), Point.new(5, 6)].uniq.length)
a033 = [Point.new(1, 2), Point.new(3, 4), Point.new(1, 2), Point.new(5, 6)]; v033 = a033.uniq.length; p v033
