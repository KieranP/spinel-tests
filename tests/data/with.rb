# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#with
a001 = Point.new(1, 2)
p(a001.with(y: 20))
v001 = a001.with(y: 20); p(v001)
# no arguments -> equal copy
p(a001.with)
v002 = a001.with; p(v002)
# nested Data member replaced via #with
Outer = Data.define(:inner, :label)
o001 = Outer.new(Point.new(1, 2), "top")
p(o001.with(inner: Point.new(9, 9)))
vo001 = o001.with(label: "bot"); p(vo001)
# unknown member keyword: Ruby raises ArgumentError, Spinel aborts compilation
r003 = (a001.with(z: 9) rescue $!.class); p r003
r744 = ([Point.new(1, 2)].map { |pt744| pt744.with(y: 9) }.map(&:y) rescue $!.class); p r744
# receiver and keyword-argument values held in locals
b001 = Point.new(1, 2); nx001 = 7; ny001 = 8
p(b001.with(x: nx001, y: ny001))
v003 = b001.with(x: nx001, y: ny001); p(v003)
hw001 = { y: 20 }
rw001 = (a001.with(**hw001) rescue $!.class); p rw001
Bumpy010 = Data.define(:a, :b) do
  def bump = with(b: b + 1)
end
p(Bumpy010.new(a: 1, b: 2).bump.to_h)
