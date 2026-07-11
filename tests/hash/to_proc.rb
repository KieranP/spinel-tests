# frozen_string_literal: true
# Hash#to_proc
p({ a: 1, b: 2 }.to_proc.call(:a))
a222 = { a: 1, b: 2 }; b222 = a222.to_proc; p(b222.call(:b))
p([:a, :b].map(&{ a: 1, b: 2 }))
c222 = { a: 1, b: 2 }; d222 = ([:a, :b].map(&c222)); p d222
# proc returns nil for an absent key
p({ a: 1, b: 2 }.to_proc.call(:z))
e222 = { a: 1, b: 2 }; f222 = e222.to_proc; p(f222.call(:z))
# proc over String keys
p({ "x" => 10, "y" => 20 }.to_proc.call("x"))
g222 = { "x" => 10, "y" => 20 }; h222 = g222.to_proc; p(h222.call("y"))
# proc over Integer keys
p({ 1 => "one", 2 => "two" }.to_proc.call(1))
i222 = { 1 => "one", 2 => "two" }; j222 = i222.to_proc; p(j222.call(2))
# map with some keys absent -> nils
p([:a, :z, :b].map(&{ a: 1, b: 2 }))
k222 = { a: 1, b: 2 }; l222 = ([:a, :z, :b].map(&k222)); p l222
# hash with a default used through the proc
m222 = Hash.new(0); m222[:a] = 5; n222 = m222.to_proc; p(n222.call(:absent))

# to_proc result captured, then called on a present key
za940 = { a: 1, b: 2 }; zb940 = za940.to_proc; zc940 = zb940.call(:a); p zc940
# &hash mapping mixed present/absent keys, captured
za941 = { x: 10 }; zc941 = ([:x, :y].map(&za941)); p zc941
# direct single call on a present key
p({ a: 1, b: 2 }.to_proc.call(:b))
