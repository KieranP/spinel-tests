# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#members
p(Point.new(3, 4).members)
v005 = Point.new(3, 4).members; p(v005)

# Struct.members (class-level)
Mem144 = Struct.new(:a, :b)
p(Mem144.new(1, 2).members)
v029 = Mem144.new(1, 2).members; p(v029)
p(Mem144.members)
v030 = Mem144.members; p(v030)

# members is a fresh Array each call, and mutating it does not change the class
p(Mem144.members.frozen?)
m145 = Mem144.members; m145 << :zz; p(Mem144.members)
v145 = Mem144.members; p(v145)
# a Struct built with keyword_init, and one built inline in a superclass position
Kw146 = Struct.new(:a, :b, keyword_init: true)
p(Kw146.members)
v146 = Kw146.new(a: 1).members; p(v146)
class Sub147 < Struct.new(:p, :q)
end
p(Sub147.members)
v147 = Sub147.new(1, 2).members; p(v147)
# a single-member and a many-member Struct
p(Struct.new(:only).members)
v148 = Struct.new(:a, :b, :c, :d, :e).members; p(v148)
