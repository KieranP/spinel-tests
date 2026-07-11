# frozen_string_literal: true
# Hash#store
p({ a: 1 }.store(:b, 2))
a331 = { a: 1 }; a331.store(:b, 2); p(a331)
a332 = { a: 1 }; b332 = :b; a332.store(b332, 2); p(a332)
a333 = { a: 1 }; c333 = (a333.store(:b, 2)); p c333
# return value is the stored value
p({ a: 1 }.store(:b, 99))
st01 = { a: 1 }; st01r = (st01.store(:b, 99)); p st01r
# overwrite an existing key
st02 = { a: 1 }; st02.store(:a, 100); p(st02)
# String keys
st03 = { "a" => 1 }; st03.store("b", 2); p(st03)
p({ "a" => 1 }.store("b", 2))
# Integer keys
st04 = { 1 => "x" }; st04.store(2, "y"); p(st04)
# storing nil as a value
st05 = { a: 1 }; st05.store(:b, nil); p(st05)
# store into an empty hash (runtime: Symbol key rendered as a String, unlike []=)
st06 = {}; st06.store(:a, 1); p(st06)
# store then read the key back
st07 = { a: 1 }; st07.store(:b, 2); p(st07[:b])

# a splatted argument list
sk96 = [:b, 2]
st96 = { a: 1 }; st96.store(*sk96); p(st96)
st97 = { a: 1 }; sv97 = st97.store(*sk96); p sv97

# An Array stored by #store into a {}-created Hash reads nil at every Integer index
# once it is bound to a local.
hy377 = {}
hy377.store("a", [7, 8, 9])
ry378 = hy377["a"]
p ry378[0]
wy377 = ry378[0]; p wy377

# Kept commented: storing a key of a type the Hash was not inferred for warns, then the compiled
# program prints nothing at all and exits 1, which would swallow every line above it.
h448 = { a: 1 }; h448.store("x", 9); p h448
# Control: a same-type key stores correctly.
h449 = { a: 1 }; h449.store(:b, 2); p h449
