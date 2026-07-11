# frozen_string_literal: true
# Hash#merge
p({ a: 1 }.merge({ b: 2 }))
a043 = { a: 1 }; p(a043.merge({ b: 2 }))
a044 = { a: 1 }; b044 = { b: 2 }; p(a044.merge(b044))
a045 = { a: 1 }; b045 = { b: 2 }; c045 = (a045.merge(b045)); p c045
p({ a: 1 }.merge({ a: 2 }) { |_k, old, new| old + new })
a300 = { a: 1 }; b300 = { a: 2 }; c300 = (a300.merge(b300) { |_k, old, new| old + new }); p c300
p({ a: 1 }.merge({ b: 2 }, { c: 3 }))
a216 = { a: 1 }; c216 = (a216.merge({ b: 2 }, { c: 3 })); p c216
p({ a: 1 }.merge({ a: 10 }, { a: 20 }) { |_k, o, n| o + n })
b216 = { a: 1 }; d216 = (b216.merge({ a: 10 }, { a: 20 }) { |_k, o, n| o + n }); p d216
# merge with String keys
p({ "a" => 1 }.merge({ "b" => 2 }))
ma01 = { "a" => 1 }; mb01 = { "b" => 2 }; mc01 = (ma01.merge(mb01)); p mc01
# merge with Integer keys
p({ 1 => "x" }.merge({ 2 => "y" }))
ma02 = { 1 => "x" }; mc02 = (ma02.merge({ 2 => "y" })); p mc02
# merge overwrites an existing key (no block, later wins)
p({ a: 1, b: 2 }.merge({ b: 20 }))
ma03 = { a: 1, b: 2 }; mc03 = (ma03.merge({ b: 20 })); p mc03
# zero-argument merge
p({ a: 1 }.merge)
# folding an array of Hashes with merge and an empty-Hash accumulator
p [{ a: 1 }, { b: 2 }, { a: 3 }].reduce({}) { |acc, hh| acc.merge(hh) { |_k, o, n| o + n } }

# Hash#merge as the combining step of an initial-value-less reduce emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
p([{ a: 1 }, { a: 2 }].reduce { |x747, y747| x747.merge(y747) })
r747 = [{ a: 1 }, { a: 2 }].reduce { |x748, y748| x748.merge(y748) }; p r747

# A splatted array of Hashes emits ill-typed C.
# Kept commented: the compile abort takes down the whole file.
hs840 = [{ b: 2 }]; p({ a: 1 }.merge(*hs840))
hs841 = [{ b: 2 }, { c: 3 }]; m841 = { a: 1 }.merge(*hs841); p m841
# Control: the same Hashes spread positionally compile and match.
p({ a: 1 }.merge({ b: 2 }))
m842 = { a: 1 }.merge({ b: 2 }, { c: 3 }); p m842

# merge with container values, resolved by the conflict block, read back through
# a local
mc843 = { k: [1] }.merge({ k: [2] }) { |_k843, o843, n843| o843 + n843 }
p mc843
w843 = mc843[:k]; p w843[0]
# merge over an empty receiver and an empty argument
p({}.merge({ a: 1 }))
m844 = {}.merge({ a: 1 }); p m844
# Merging an empty Hash literal compiles with an incompatible-pointer warning
# (the result is right, so this is invisible to a stdout diff).
p({ a: 1 }.merge({}))
m845 = { a: 1 }.merge({}); p m845
p({ "a" => 1 }.merge({}))
m846 = { "a" => 1 }.merge({}); p m846
# The Integer-keyed receiver goes further and kills the binary, taking the whole
# file's output with it, so it lives only in the report's repro.
m847i = { 1 => 2 }.merge({}); p m847i
# the conflict block sees key, old and new
p({ a: 1, b: 2 }.merge({ a: 10, c: 30 }) { |k847, o847, n847| [k847, o847, n847] })
m847 = { a: 1 }.merge({ a: 10 }) { |k, o, n| [k, o, n] }; p m847
