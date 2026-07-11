# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#deconstruct_keys
p(Point.new(1, 2).deconstruct_keys([:x]))
v001 = Point.new(1, 2).deconstruct_keys([:x]); p(v001)
p(Point.new(1, 2).deconstruct_keys(nil))
v002 = Point.new(1, 2).deconstruct_keys(nil); p(v002)
# hash pattern match
a003 = Point.new(5, 6)
case a003
in {x:, y:}
  p([x, y])
end
# class-name hash pattern (dispatches to #deconstruct_keys)
b003 = Point.new(7, 8)
case b003
in Point(x:, y:)
  p([:cls_kw, x, y])
end
# pattern with a literal member and a bound type-checked member
case b003
in Point(x: 7, y: Integer => yy)
  p([:lit, yy])
end
# a non-matching class pattern raises NoMatchingPatternError
rnm = (begin; case b003; in Point(x: 999); :matched; end; rescue NoMatchingPatternError; :nomatch; end); p rnm
# a key array of only real members, an empty array, and nil all work
p(Point.new(1, 2).deconstruct_keys([:x, :y]))
v003 = Point.new(1, 2).deconstruct_keys([]); p(v003)

c636 = Point.new(1, 2)
p(c636.deconstruct_keys([:x, :nope]))

Pt617 = Data.define(:x, :y)
t617 = [Pt617.new(3, 4)].first
r617 = (case t617; in { x:, y: }; [x, y]; end rescue $!.class); p r617

Ud890 = Data.define(:name)
hd890 = { user: Ud890.new("Alice") }
r890 = (case hd890; in { user: Ud890[name:] } then name; end rescue $!.class); p r890
