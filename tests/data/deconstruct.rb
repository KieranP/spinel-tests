# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#deconstruct
p(Point.new(1, 2).deconstruct)
v001 = Point.new(1, 2).deconstruct; p(v001)
# array pattern match
a002 = Point.new(3, 4)
case a002
in [x002, y002]
  p([x002, y002])
end
# class-name array pattern (dispatches to #deconstruct)
b002 = Point.new(7, 8)
case b002
in Point[bx, by]
  p([:cls_arr, bx, by])
end

# multiple assignment from #deconstruct of a plain-local Data value (control that works)
c002 = Point.new(9, 10)
mx002, my002 = c002.deconstruct
p([mx002, my002])
# result of #deconstruct captured and used
d002 = Point.new(11, 12)
v002 = d002.deconstruct; p(v002)

V896 = Data.define(:x896, :y896)
first896 = [V896.new(1, 2)].first
a896, b896 = first896.deconstruct
p [a896, b896]

# An array sub-pattern nested inside an array pattern never destructures a Data
# element. Runtime error, so these stay live.
Pt897 = Data.define(:a, :b)
arr897 = [Pt897.new(1, 2)]
r897 = (case arr897; in [Pt897[x897, y897]] then [x897, y897]; end rescue $!.class); p r897
r898 = (case arr897; in [[x898, y898]] then [x898, y898]; end rescue $!.class); p r898
# the same nesting with a HASH sub-pattern, or a binding pattern, matches
r899 = (case arr897; in [Pt897(a: x899, b: y899)] then [x899, y899]; end rescue $!.class); p r899
r900 = (case arr897; in [Pt897 => e900] then e900.a; end rescue $!.class); p r900
