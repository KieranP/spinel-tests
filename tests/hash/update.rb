# frozen_string_literal: true
# Hash#update
p({ a: 1 }.update({ b: 2 }))
a308 = { a: 1 }; a308.update({ b: 2 }); p(a308)
a309 = { a: 1 }; b309 = { b: 2 }; a309.update(b309); p(a309)
a310 = { a: 1 }; c310 = (a310.update({ b: 2 })); p c310
# multiple-hash arguments
p({ a: 1 }.update({ b: 2 }, { c: 3 }))
up01 = { a: 1 }; up01.update({ b: 2 }, { c: 3 }); p(up01)
# block conflict resolver
p({ a: 1 }.update({ a: 10 }) { |_k, o, n| o + n })
up02 = { a: 1 }; up02.update({ a: 10 }) { |_k, o, n| o + n }; p(up02)
# overwrite: later value wins
p({ a: 1, b: 2 }.update({ b: 20 }))
up03 = { a: 1, b: 2 }; up03.update({ b: 20 }); p(up03)
# String keys
p({ "a" => 1 }.update({ "b" => 2 }))
up04 = { "a" => 1 }; up04.update({ "b" => 2 }); p(up04)
# Integer keys
p({ 1 => "x" }.update({ 2 => "y" }))
up05 = { 1 => "x" }; up05.update({ 2 => "y" }); p(up05)
# updating with an empty hash (empty argument is fine)
up06 = { a: 1 }; up06.update({}); p(up06)
# updating INTO an empty-variable receiver (bare-literal {}.update works)
up08 = {}; up08.update({ a: 1 }); p(up08)
# return value is the receiver itself
up07 = { a: 1 }; p(up07.update({ b: 2 }).equal?(up07))

# A splatted array of Hashes is refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
hs840 = [{ b: 2 }]; h840 = { a: 1 }; h840.update(*hs840); p h840
hs841 = [{ b: 2 }]; h841 = { a: 1 }; r841 = h841.update(*hs841); p r841
# Control: the same Hash spread positionally compiles and matches.
h842 = { a: 1 }; h842.update({ b: 2 }); p h842
h843 = { a: 1 }; r843 = h843.update({ b: 2 }); p r843

# update with container values resolved by the conflict block, read back through
# a local
h844 = { k: [1] }; h844.update({ k: [2] }) { |_k844, o844, n844| o844 + n844 }; p h844
w844 = h844[:k]; p w844[0]

# Kept commented: updating with a key of a type the Hash was not inferred for warns, then the
# compiled program prints nothing at all and exits 1, swallowing every line above it.
h450 = { a: 1 }; h450.update({ "x" => 9 }); p h450
# Control: a same-type key updates correctly.
h451 = { a: 1 }; h451.update({ b: 2 }); p h451
