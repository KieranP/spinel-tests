# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data — accessors
pt1 = Point.new(1, 2)
p(pt1.x)
v001 = pt1.x; p(v001)
p(pt1.y)
v002 = pt1.y; p(v002)

# a member holding a container: reader result used directly and captured
Box2 = Data.define(:items)
box2 = Box2.new([10, 20, 30])
p(box2.items.sum)
v003 = box2.items; p(v003)

Coll = Data.define(:class, :hash)
coll1 = Coll.new("k", 5)
p(coll1.class)
vc01 = coll1.class; p vc01
p(coll1.hash)
vc02 = coll1.hash; p vc02

EventBP = Data.define(:day, :hour)
p [EventBP.new("Mon", 9)].map { |e| e.day }
# A field named after a String method, read inside a block
DColl = Data.define(:ip, :bytes)
[DColl.new(ip: "a", bytes: 10)].each { |d020| p d020.bytes }
v021 = [DColl.new(ip: "a", bytes: 10)].map { |d021| d021.bytes }; p v021
# the same read outside a block is correct
d022 = DColl.new(ip: "a", bytes: 10); p d022.bytes
# A field named after a String-RETURNING String method still resolves to that String
# method when read inside a block. Runtime value difference, so it stays live.
DUp = Data.define(:ip, :upcase)
[DUp.new(ip: "a", upcase: 10)].each { |d023| p d023.upcase }
v024 = [DUp.new(ip: "a", upcase: 10)].map { |d024| d024.upcase }; p v024
# the same read outside a block is correct
d025 = DUp.new(ip: "a", upcase: 10); p d025.upcase
