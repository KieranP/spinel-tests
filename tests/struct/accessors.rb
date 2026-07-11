# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct — accessors
pt1 = Point.new(1, 2)
p(pt1.x)
v001 = pt1.x; p(v001)
p(pt1.y)
v002 = pt1.y; p(v002)

# writer accessors (member=)
Acc = Struct.new(:x, :y)
w1 = Acc.new(1, 2); w1.x = 10; p(w1.x)
w2 = Acc.new(1, 2); w2.y = 20; v003 = w2.y; p(v003)
# writer returns the assigned value
w3 = Acc.new(1, 2); v004 = (w3.x = 30); p(v004)
# A member named after a String method, read inside a block
Coll = Struct.new(:ip, :bytes)
[Coll.new("a", 10)].each { |e005| p e005.bytes }
p([Coll.new("a", 10)].map { |e006| e006.bytes })
v007 = [Coll.new("a", 10)].map { |e007| e007.bytes }; p v007
# the same read outside a block is correct
e008 = Coll.new("a", 10); p e008.bytes
Coll2 = Struct.new(:chars, :lines, :length)
[Coll2.new(1, 2, 3)].each { |e009| p [e009.chars, e009.lines, e009.length] }
v010 = [Coll2.new(1, 2, 3)].map { |e010| e010.chars }; p v010
# Readers named after the String-RETURNING String methods still diverge inside a block.
# Runtime value difference, so it stays live.
Coll3 = Struct.new(:upcase, :downcase, :strip, :reverse, :succ)
[Coll3.new(1, 2, 3, 4, 5)].each { |e011| p [e011.upcase, e011.downcase, e011.strip, e011.reverse, e011.succ] }
v012 = [Coll3.new(1, 2, 3, 4, 5)].map { |e012| e012.upcase }; p v012
# the same reads outside a block are correct
e013 = Coll3.new(1, 2, 3, 4, 5); p [e013.upcase, e013.downcase, e013.strip, e013.reverse, e013.succ]

# accessors read through an Enumerable pipeline over an Array of Structs, with
# every intermediate captured in a local
Emp014 = Struct.new(:name, :dept, :sal)
list014 = [Emp014.new("bob", "x", 30), Emp014.new("amy", "y", 25), Emp014.new("cid", "x", 35)]
g014 = list014.group_by { |e| e.dept }; p(g014.keys.sort)
p(g014["x"].map { |e| e.name })
s015 = list014.sort_by { |e| -e.sal }; p(s015.map { |e| e.name })
m016 = list014.min_by { |e| e.sal }; p(m016.name)
x017 = list014.max_by { |e| e.sal }; p(x017.name)
t018 = list014.sum { |e| e.sal }; p(t018)
o019 = list014.each_with_object({}) { |e, h| h[e.name] = e.sal }; p(o019)
pr020 = list014.partition { |e| e.sal > 28 }; p(pr020.map { |g| g.map { |e| e.name } })
r021 = list014.reduce(0) { |acc, e| acc + e.sal }; p(r021)
f022 = list014.find { |e| e.name.start_with?("c") }; p(f022.sal)
h023 = list014.to_h { |e| [e.name, e.dept] }; p(h023)
i024 = list014.each_with_index.map { |e, n| "#{n}:#{e.name}" }; p(i024)
t025 = list014.map { |e| e.dept }.tally; p(t025)

# a member holding an Array of the same Struct, read back through a local
Node026 = Struct.new(:val, :kids)
tree026 = Node026.new(1, [Node026.new(2, []), Node026.new(3, [Node026.new(4, [])])])
k026 = tree026.kids; p(k026.map { |n| n.val })
d027 = tree026.kids[1].kids[0]; p(d027.val)
p(tree026.kids.map { |n| n.kids.size })
tree026.kids[0].val = 99
p(tree026.kids[0].val)

# a Hash whose values are Structs, read back through a local
Rec028 = Struct.new(:k, :v)
h028 = { "a" => Rec028.new("a", 1), "b" => Rec028.new("b", 2) }
p(h028["a"].v)
r028 = h028["b"]; p(r028.v)
v029 = h028.values.map { |r| r.v }; p(v029)
p(h028.transform_values { |r| r.v })
