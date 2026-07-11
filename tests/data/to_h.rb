# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#to_h
p(Point.new(1, 2).to_h)
v001 = Point.new(1, 2).to_h; p(v001)
# with block
p(Point.new(1, 2).to_h { |k, v| [k, v * 10] })
v002 = Point.new(1, 2).to_h { |k, v| [k, v * 10] }; p(v002)
# result of #to_h used through Hash methods
a003 = Point.new(3, 4)
p(a003.to_h.keys)
v003 = a003.to_h.values; p(v003)
# mixed member types round-trip through #to_h
Mixed = Data.define(:s, :n, :arr)
m004 = Mixed.new("hi", 7, [1, 2])
p(m004.to_h)
v004 = m004.to_h; p(v004)
# a Data value held as a member is kept as-is in the hash
Outer = Data.define(:inner, :label)
o005 = Outer.new(Point.new(1, 2), "top")
p(o005.to_h)
v005 = o005.to_h; p(v005)
Selfy006 = Data.define(:a, :b) do
  def to_hash = (to_h rescue $!.class)
end
p(Selfy006.new(a: 1, b: 2).to_hash)
v006 = Selfy006.new(a: 1, b: 2).to_hash; p v006
# a block that swaps key and value emits ill-typed C
p(Point.new(1, 2).to_h { |k007, v007| [v007, k007] })
v007 = Point.new(1, 2).to_h { |k008, v008| [v008, k008] }; p v007
# A block whose value is an Array or Hash literal is nil-filled. Runtime value
# difference, so these stay live.
p(Point.new(1, 2).to_h { |k009, v009| [k009, [v009]] })
v009 = Point.new(1, 2).to_h { |k010, v010| [k010, [v010]] }; p v009
p(Point.new(1, 2).to_h { |k011, v011| [k011, { m: v011 }] })
v011 = Point.new(1, 2).to_h { |k012, v012| [k012, { m: v012 }] }; p v011
