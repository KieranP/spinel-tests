# frozen_string_literal: true
# Hash#shift
h = { a: 1, b: 2 }; x = (h.shift); p x; p h
p({}.shift)
# repeated shift removes entries in insertion order (FIFO)
sh01 = { a: 1, b: 2, c: 3 }; p(sh01.shift); p(sh01.shift); p(sh01)
# direct-literal shift returns the first [k, v] pair
p({ a: 1, b: 2 }.shift)
# String keys
sh02 = { "a" => 1, "b" => 2 }; p(sh02.shift); p(sh02)
# Integer keys
sh03 = { 1 => "x", 2 => "y" }; p(sh03.shift); p(sh03)
# shifting the only entry leaves an empty hash
sh04 = { a: 1 }; sh04r = (sh04.shift); p sh04r; p(sh04)
# shift on an empty hash returns nil
sh05 = {}; sh05r = (sh05.shift); p sh05r

# shift returns the [key, value] pair; a container value survives destructuring
hs377 = {}; hs377["a"] = [7, 8, 9]
k377, v377 = hs377.shift
p k377; p v377; p v377[0]; p hs377
# shift on an empty Hash is nil
p({}.shift)
r378 = {}.shift; p r378
