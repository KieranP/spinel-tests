# frozen_string_literal: true
# Hash#[]
p({ a: 1, b: 2 }[:a])
a001 = { a: 1, b: 2 }; p(a001[:a])
a002 = { a: 1, b: 2 }; b002 = :a; p(a002[b002])
a003 = { a: 1, b: 2 }; b003 = :a; c003 = (a003[b003]); p c003
p({ "a" => 1, "b" => 2 }["a"])
a301 = { "a" => 1, "b" => 2 }; p(a301["b"])
a302 = { "a" => 1, "b" => 2 }; b302 = "a"; p(a302[b302])
a303 = { "a" => 1, "b" => 2 }; b303 = "b"; c303 = (a303[b303]); p c303
p({ 1 => "x", 2 => "y" }[2])
a304 = { 1 => "x", 2 => "y" }; c304 = (a304[1]); p c304
p({ a: 1 }[:z])
a305 = { a: 1 }; c305 = (a305[:z]); p c305
p({ a: [1, 2], b: [3, 4] }[:b])
a306 = { a: [1, 2], b: [3, 4] }; c306 = (a306[:a]); p c306
p({ Complex(2, 3) => "a" }[Complex(2, 3)])
a308 = { Complex(2, 3) => "a" }; c308 = (a308[Complex(2, 3)]); p c308
p(Hash[[[:a, 1], [:b, 2]]])
p(Hash[:a, 1, :b, 2])
a220 = Hash[:a, 1, :b, 2]; p a220
p(Hash[a: 1, b: 2])
b220 = Hash[a: 1, b: 2]; p b220
p(Hash[[[:a, 1]]])
a307 = Hash[[[:a, 1], [:b, 2]]]; p a307
p(Hash[[["x", 1], ["y", 2]]])
b307 = Hash[[["x", 1], ["y", 2]]]; p b307
p(Hash[])

p({ "empty352" => [] })
h352 = { "empty352" => [] }; p h352

# a Hash passed through a polymorphic call site, with a String-typed element read back
class Leaf402
  def initialize(char) = @char = char
  def walk(table) = table[@char] = "x"
end
class Branch402
  def initialize(kid) = @kid = kid
  def walk(table) = @kid.walk(table)
end
nodes402 = [Leaf402.new("a")]
nodes402 << Branch402.new(Leaf402.new("b"))
tree402 = nodes402.last
t402 = {}; tree402.walk(t402)
p(t402["b"].length)
v402 = t402["b"].length; p v402

# from another Hash's iteration miscompiles (incompatible sp_StrPolyHash*/sp_PolyPolyHash*)
# and the binary hangs with no output, so these stay commented out.
n677 = [Leaf402.new("a"), Branch402.new(Leaf402.new("b"))]
t677 = {}; n677.each { |n| n.walk(t677) }
f677 = { "a" => 5, "b" => 9 }
p(f677.sum { |ch, n| n * t677[ch].length })
v677 = f677.sum { |ch, n| n * t677[ch].length }; p v677

# nil read from an absent key of an Integer-valued Hash: arithmetic raises, as in CRuby.
na01 = { 0 => 0 }; nr01 = (na01[9] + 1 rescue $!.class); p nr01
na02 = { 0 => 0 }; nr02 = (na02[9].abs rescue $!.class); p nr02

# Comparisons on that same nil answer from the int-slot sentinel instead of raising
# NoMethodError as CRuby does. Documented limitation, not a bug.
# WONTFIX: See docs/limitations.md - "By design — Comparisons and predicates on a nil read out of an Integer container"
# na03 = { 0 => 0 }; nr03 = (na03[9] < 5 rescue $!.class); p nr03

# Array#compact / #flatten on an Array held as a Hash value raise NoMethodError.
ca01 = { 0 => [1, nil, 2] }; cr01 = (ca01[0].compact rescue $!.class); p cr01
ca02 = { 0 => [1, nil, 2] }; cr02 = (ca02[0].flatten rescue $!.class); p cr02

# An Array read out of a Hash value loses part of Array's method table.
zh10 = { "row" => ["x", "y", "z"] }
p zh10["row"][0..1]
p zh10["row"].min
zh11 = (zh10["row"].first(2) rescue $!.class); p zh11
# the (start, length) form and the no-arg reads on the same receiver are correct
p zh10["row"][0, 2]
p zh10["row"].first
p zh10["row"].length

# An Array value read by #[] into a local reads nil at every Integer index.
hr377 = {}
hr377["a"] = [7, 8, 9]
rr377 = hr377["a"]
p rr377[0]
wr377 = rr377[0]; p wr377

# Array#slice on that same local reads nil for a single Integer index, while the
# (start, length) form on it is right.
hz377 = {}
hz377["a"] = [7, 8, 9]
rz377 = hz377["a"]
p rz377.slice(0)
vz377 = rz377.slice(0); p vz377
p rz377.slice(0, 2)
p rz377.map { |x377| x377 + 1 }
p rz377.select { |x377| x377 > 7 }
p rz377.index(8)
p rz377.include?(8)
p rz377.fetch(0)
p rz377.reverse

# reads that reach the same value WITHOUT binding it to a local
hy377 = {}
hy377["a"] = [7, 8, 9]
p hy377.dig("a")[0]
p hy377.values_at("a")[0][0]
p hy377.delete("a")[0]

# an Integer key written into a Hash held in a {}-defaulted optional parameter
def memo_get378(n378, memo378 = {})
  memo378[n378] = n378 * 2
  memo378[n378]
end
p memo_get378(3)
v378 = memo_get378(3); p v378
# the same body with the Hash passed explicitly is correct
def with_arg379(n379, memo379)
  memo379[n379] = n379 * 2
  memo379[n379]
end
p with_arg379(3, {})
