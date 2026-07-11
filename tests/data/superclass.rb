# frozen_string_literal: true
Point = Data.define(:x, :y)

# Point.superclass
p(Point.superclass)
v001 = Point.superclass; p v001
# a Data class defined with a block has the same superclass
Blk002 = Data.define(:a) do
  def double = a * 2
end
p(Blk002.superclass)
v002 = Blk002.superclass; p v002
# a member-less Data class too
Empty003 = Data.define
p(Empty003.superclass)
v003 = Empty003.superclass; p v003
