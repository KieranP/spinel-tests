# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#[]
Idx142 = Struct.new(:x, :y)
p(Idx142.new(10, 20)[0])
v024 = Idx142.new(10, 20)[0]; p(v024)
p(Idx142.new(10, 20)[:x])
v025 = Idx142.new(10, 20)[:x]; p(v025)
p(Idx142.new(10, 20)["x"])
v026 = Idx142.new(10, 20)["x"]; p(v026)
p(Idx142.new(10, 20)[-1])
v032 = Idx142.new(10, 20)[-1]; p(v032)
# receiver in a variable
r041 = Idx142.new(10, 20); p(r041[1])
r042 = Idx142.new(10, 20); v043 = r042[:y]; p(v043)
# a member holding a container
Box044 = Struct.new(:items, :meta)
p(Box044.new([1, 2], { k: 3 })[0])
v044 = Box044.new([1, 2], { k: 3 })[:meta]; p(v044)

# Struct.[] (class-level constructor, alias for .new)
p(Point[3, 4].x)
v033 = Point[3, 4]; p(v033.to_a)

# A key the compiler cannot fold to a member — an index/name held in a local, or
# a literal that names no member — emits ill-typed C.
S045 = Struct.new(:a, :b)
s045 = S045.new(1, 2); i045 = 1; p s045[i045]
S046 = Struct.new(:a, :b)
s046 = S046.new(1, 2); k046 = :b; p s046[k046]
S047 = Struct.new(:a, :b)
r047 = (S047.new(1, 2)[9] rescue $!.class); p r047
S048 = Struct.new(:a, :b)
r048 = (S048.new(1, 2)[:zz] rescue $!.class); p r048
r049 = (S048.new(1, 2)["zz"] rescue $!.class); p r049

# Struct#[] read inside a block yields nil for every member. Runtime value
# difference, so it stays live.
Blk034 = Struct.new(:ip, :ms)
[Blk034.new("a", 10)].each { |e034| p e034[:ms] }
[Blk034.new("a", 10)].each { |e035| p e035["ms"] }
[Blk034.new("a", 10)].each { |e036| p e036[1] }
[Blk034.new("a", 10)].each { |e037| p [e037[:ip], e037[:ms]] }
p([Blk034.new("a", 10)].map { |e038| e038[:ms] })
v039 = [Blk034.new("a", 10)].map { |e039| e039[:ms] }; p v039
# outside a block the same read is correct
e040 = Blk034.new("a", 10); p e040[:ms]
