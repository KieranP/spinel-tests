# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#to_a
p(Point.new(3, 4).to_a)
v003 = Point.new(3, 4).to_a; p(v003)
pt2 = Point.new(5, 6); p(pt2.to_a)
v004 = pt2.to_a; p(v004)

# Struct#to_a
Coll141 = Struct.new(:x, :y)
p(Coll141.new(3, 4).to_a)
v023 = Coll141.new(3, 4).to_a; p(v023)

E585 = Struct.new(:a585, :b585)
x585 = [E585.new(1, 2), E585.new(3, 4)].max_by(&:b585)
r585 = (x585.to_a rescue $!.class); p r585

# heterogeneous members captured through to_a / values
Het = Struct.new(:i, :s, :arr)
p(Het.new(1, "hi", [4, 5]).to_a)
vhet = Het.new(1, "hi", [4, 5]).to_a; p(vhet)
p(Het.new(7, "x", [8]).values)
vval = Het.new(7, "x", [8]).values; p(vval)
