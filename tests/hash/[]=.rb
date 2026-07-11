# frozen_string_literal: true
# Hash#[]=
p(({ a: 1 }[:b] = 2))
a339 = { a: 1 }; a339[:b] = 2; p(a339)
a340 = { a: 1 }; b340 = :b; a340[b340] = 2; p(a340)
a341 = { a: 1 }; c341 = (a341[:b] = 2); p c341
# `h[k] ||= v` on an absent key of a non-empty receiver stores nothing and yields nil.
ba01 = { 0 => 0 }; p(ba01[5] ||= 5)
ba02 = { 0 => 0 }; ba02[5] ||= 5; p ba02
ba03 = { "a" => 1 }; bv03 = (ba03["b"] ||= 2); p bv03
ba04 = Hash.new; p(ba04[3] ||= 3)

# String keys
p(({ "a" => 1 }["b"] = 2))
sa01 = { "a" => 1 }; sa01["b"] = 2; p(sa01)
sc01 = ({ "a" => 1 }["b"] = 5); p sc01
# Integer keys, String values
p(({ 1 => "x" }[2] = "y"))
ia01 = { 1 => "x" }; ia01[2] = "y"; p(ia01)
ic01 = ({ 1 => "x" }[2] = "z"); p ic01
# overwrite an existing key
oa01 = { a: 1 }; oa01[:a] = 99; p(oa01)
oa02 = { a: 1 }; ov02 = 42; oa02[:a] = ov02; p(oa02)
# Float values
fa01 = { a: 1.5 }; fa01[:b] = 2.5; p(fa01)
fc01 = ({ a: 1.5 }[:b] = 9.5); p fc01
# nested Array value
na01 = { a: [1] }; na01[:b] = [2, 3]; p(na01)
# nested Hash value
ha01 = { a: { x: 1 } }; ha01[:b] = { y: 2 }; p(ha01)
def fill108(h108); h108[1] = 100; end
mh108 = {}; fill108(mh108); p mh108
def store614(m614, n614); m614[n614] ||= n614 * 10; end
mm614 = {}; store614(mm614, 1); p mm614.size
sv614 = {}; store614(sv614, 1); p sv614
TBL897 = {}
"abc".each_char.with_index { |ch897, i897| TBL897[ch897] = i897 }
def parse897(s897); s897.each_char.reduce(0) { |acc897, c897| acc897 * 10 + TBL897[c897] }; end
p parse897("bca")
def mark352(h352, k352); h352[k352] = true; end
m352 = {}; mark352(m352, :a); p m352
# `h[k] ||= []` with an Integer-valued parameter key
def bucket028(k028); h028 = {}; h028[k028] ||= []; h028[k028] << 1; h028; end
p bucket028(0)
v028 = bucket028(0); p v028
def bucket029(k029); h029 = {}; h029[k029] ||= {}; h029; end
p bucket029(0)

# storing key.to_s into a parameter that defaults to {}
def flat999(node999, acc999 = {})
  node999.each { |k999, v999| acc999[k999.to_s] = v999 }
  acc999
end
p(flat999({ "a" => 1 }))
r999 = flat999({ "a" => 1 }); p r999

# A splatted key stores the array itself as the key: Ruby {a: 1, b: 9}.
k996 = [:b]
h996 = { a: 1 }; h996[*k996] = 9; p h996
h997 = { a: 1 }; v997 = (h997[*k996] = 9); p v997; p h997

# An Array stored by #[]= into a {}-created Hash reads nil at every Integer index
# once it is bound to a local.
hw377 = {}
hw377["a"] = [7, 8, 9]
rw377 = hw377["a"]
p rw377[0]
ww377 = rw377[0]; p ww377

# The same read-back through a local with Symbol and Integer keys.
hs377 = {}
hs377[:a] = [7, 8, 9]
rs377 = hs377[:a]
p rs377[0]
vs377 = rs377[0]; p vs377
hi377 = {}
hi377[1] = [7, 8, 9]
ri377 = hi377[1]
p ri377[0]
vi377 = ri377[0]; p vi377
# A Hash value with Integer keys reads nil through #[] on the same local.
hh377 = {}
hh377["a"] = { 1 => "x", 2 => "y" }
ih377 = hh377["a"]
p ih377[1]
wh377 = ih377[1]; p wh377
# Control: the same inner Hash answers #fetch and #dig correctly.
p ih377.fetch(2)
p ih377.dig(1)

# Container values reached by the other build paths all read back correctly.
hb378 = Hash[[["a", [7, 8, 9]]]]; rb378 = hb378["a"]; p rb378[0]
hc378 = [["a", [7, 8, 9]]].to_h; rc378 = hc378["a"]; p rc378[0]
hd378 = {}.merge({ "a" => [7, 8, 9] }); rd378 = hd378["a"]; p rd378[0]
he378 = ["a"].each_with_object({}) { |k378, acc378| acc378[k378] = [7, 8, 9] }
re378 = he378["a"]; p re378[0]
hf378 = Hash.new { |hh378, k378| hh378[k378] = [] }; hf378["a"] << 7
rf378 = hf378["a"]; p rf378[0]
# Nested containers: an Array of Arrays, and a Hash of Hashes
hg378 = {}; hg378["a"] = [[1, 2], [3, 4]]; rg378 = hg378["a"]; p rg378.first
hi378 = {}; hi378["a"] = {}; hi378["a"]["b"] = 1; ri378 = hi378["a"]; p ri378["b"]

# A key of a type the Hash was not inferred for is coerced to the old key type, and an
# Integer-keyed Hash given a String key loses its existing entry.
h440 = { "a" => 1 }; h440[:b] = 2; p h440
h441 = { 1 => 2 }; h441[:x] = 3; p h441
h442 = { 1 => 2 }; h442["x"] = 3; p h442
h443 = Hash.new; h443[:a] = 1; p h443
# Kept commented: it warns, then the compiled program prints nothing at all and exits 1, which
# would swallow every line above it.
h444 = { a: 1 }; h444["x"] = 9; p h444
# Control: a mixed-key literal, non-mutating #merge and a same-type key are all correct.
h445 = { a: 1, "x" => 9 }; p h445
h446 = { a: 1 }; h446[:b] = 2; p h446
h447 = { a: 1 }; h447[1] = 9; p h447
