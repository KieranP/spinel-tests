# frozen_string_literal: true
# Hash#compact!
a218 = { a: 1, b: nil, c: 3 }; a218.compact!; p a218
b218 = { a: 1, b: nil, c: 3 }; c218 = (b218.compact!); p c218
# no nils present -> compact! returns nil (nothing removed)
cp01 = { a: 1, b: 2 }; cp01r = (cp01.compact!); p cp01r; p(cp01)
# all values nil -> becomes empty
cp02 = { a: nil, b: nil }; cp02.compact!; p(cp02)
# mix, captured return is the compacted hash
cp03 = { a: 1, b: nil, c: 3, d: nil }; cp03r = (cp03.compact!); p cp03r
# String keys
cp04 = { "a" => 1, "b" => nil }; cp04.compact!; p(cp04)
# Integer keys
cp05 = { 1 => nil, 2 => "y" }; cp05.compact!; p(cp05)
# empty hash -> nil (nothing to remove)
cp06 = {}; cp06r = (cp06.compact!); p cp06r
