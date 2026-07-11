# frozen_string_literal: true
Point = Data.define(:x, :y)

# Point.name
p(Point.name)
v001 = Point.name; p v001

# An anonymous Data class has no name in CRuby. Runtime value difference, so
# these stay live.
p(Data.define(:z).name)
k002 = Data.define(:z); v002 = k002.name; p v002

# a Data class defined with a block still reports its constant
Blk003 = Data.define(:a) do
  def double = a * 2
end
p(Blk003.name)
v003 = Blk003.name; p v003
