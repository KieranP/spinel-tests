# frozen_string_literal: true
# Hash#to_a
p({ a: 1, b: 2 }.to_a)
a067 = { a: 1, b: 2 }; p(a067.to_a)
a068 = { a: 1, b: 2 }; c068 = (a068.to_a); p c068

# symbol keys, string values
p({ a: "x", b: "y" }.to_a)
a069 = { a: "x", b: "y" }; c069 = a069.to_a; p c069

# string keys, integer values
p({ "x" => 1, "y" => 2 }.to_a)
a070 = { "x" => 1, "y" => 2 }; c070 = a070.to_a; p c070

# integer keys, string values
p({ 1 => "one", 2 => "two" }.to_a)
a071 = { 1 => "one", 2 => "two" }; c071 = a071.to_a; p c071

# float values
p({ a: 1.1, b: 2.2 }.to_a)
a072 = { a: 1.1, b: 2.2 }; c072 = a072.to_a; p c072

# single-entry hash
p({ a: 1 }.to_a)
a083 = { a: 1 }; c083 = a083.to_a; p c083

# empty hash
p({}.to_a)
a084 = {}; c084 = a084.to_a; p c084

# nested-Array values
p({ a: [1, 2], b: [3, 4] }.to_a)
za960 = { a: [1, 2], b: [3, 4] }; zc960 = za960.to_a; p zc960

# Safe-navigating to #to_a aborts the C build.
zt20 = [{ "a" => 1 }]
p(zt20.first&.to_a)
zt21 = [{ "a" => 1 }]
zt22 = zt21.first&.to_a
p zt22
# a Hash-typed receiver is fine
p({ "a" => 1 }&.to_a)

# a pair taken out of #to_a and read through a local
ht377 = {}; ht377["a"] = [7, 8]
pr377 = ht377.to_a[0]; p pr377; p pr377[1]
# to_a over a Hash of Hashes, then rebuilt with to_h
p({ a: { x: 1 } }.to_a)
r378 = { a: { x: 1 } }.to_a.to_h; p r378
