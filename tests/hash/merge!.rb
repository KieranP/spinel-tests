# frozen_string_literal: true
# Hash#merge!
p({ a: 1 }.merge!({ b: 2 }))
a305 = { a: 1 }; a305.merge!({ b: 2 }); p(a305)
a306 = { a: 1 }; b306 = { b: 2 }; a306.merge!(b306); p(a306)
a307 = { a: 1 }; b307 = { a: 2 }; a307.merge!(b307) { |_k, old, new| old + new }; p(a307)
# multiple-hash arguments
p({ a: 1 }.merge!({ b: 2 }, { c: 3 }))
mm01 = { a: 1 }; mm01.merge!({ b: 2 }, { c: 3 }); p(mm01)
# block conflict resolver across multiple hashes
p({ a: 1 }.merge!({ a: 10 }, { a: 20 }) { |_k, o, n| o + n })
mm02 = { a: 1 }; mm02.merge!({ a: 10 }, { a: 20 }) { |_k, o, n| o + n }; p(mm02)
# overwrite: later value wins (no block)
p({ a: 1, b: 2 }.merge!({ b: 20 }))
mm03 = { a: 1, b: 2 }; mm03.merge!({ b: 20 }); p(mm03)
# String keys
p({ "a" => 1 }.merge!({ "b" => 2 }))
mm04 = { "a" => 1 }; mm04.merge!({ "b" => 2 }); p(mm04)
# Integer keys
p({ 1 => "x" }.merge!({ 2 => "y" }))
mm05 = { 1 => "x" }; mm05.merge!({ 2 => "y" }); p(mm05)
# merging an empty hash leaves the receiver unchanged
mm06 = { a: 1 }; mm06.merge!({}); p(mm06)
# merging into an empty receiver — the variable form
mm07 = {}; mm07.merge!({ a: 1 }); p(mm07)
# return value is the receiver itself (mutation, identity preserved)
mm08 = { a: 1 }; p(mm08.merge!({ b: 2 }).equal?(mm08))

# A splatted array of Hashes is refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
hs840 = [{ b: 2 }]; h840 = { a: 1 }; h840.merge!(*hs840); p h840
hs841 = [{ b: 2 }]; h841 = { a: 1 }; r841 = h841.merge!(*hs841); p r841
# Control: the same Hash spread positionally compiles and matches.
h842 = { a: 1 }; h842.merge!({ b: 2 }); p h842
h843 = { a: 1 }; r843 = h843.merge!({ b: 2 }); p r843
