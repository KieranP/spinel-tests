# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#inspect
p(Point.new(1, 2).inspect)
a033 = Point.new(1, 2); p(a033.inspect)
a034 = Point.new(1, 2); v034 = a034.inspect; p v034
# a Struct instance nested in a container is rendered with the default object format
p([Point.new(1, 2)])
p({ k: Point.new(1, 2) })
# every member value kind
Any035 = Struct.new(:v)
p(Any035.new(nil).inspect)
p(Any035.new("x").inspect)
p(Any035.new([1, 2]).inspect)
p(Any035.new({ k: 1 }).inspect)
p(Any035.new(:sym).inspect)
p(Any035.new(1.5).inspect)
v035 = Any035.new(true).inspect; p v035
# a Struct member holding another Struct
Inner036 = Struct.new(:v); Outer036 = Struct.new(:i, :n)
p(Outer036.new(Inner036.new(1), 2).inspect)
v036 = Outer036.new(Inner036.new(1), 2).inspect; p v036
# a member-less Struct, and a Struct subclass written with the Struct.new inline
Empty037 = Struct.new(:only)
p(Empty037.new(7).inspect)
class Sub038 < Struct.new(:a, :b)
end
p(Sub038.new(1, 2).inspect)
v038 = Sub038.new(1, 2).inspect; p v038
# a keyword_init Struct inspects the same way
Kw039 = Struct.new(:a, :b, keyword_init: true)
p(Kw039.new(a: 1, b: 2).inspect)
v039 = Kw039.new(a: 1).inspect; p v039
KWI070 = Struct.new(:a, keyword_init: true)
p KWI070
p KWI070.inspect
v071 = KWI070.inspect; p v071
