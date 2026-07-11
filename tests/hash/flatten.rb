# frozen_string_literal: true
# Hash#flatten
p({ a: 1, b: 2 }.flatten)
a811 = { a: 1, b: 2 }; c811 = (a811.flatten); p c811
p({ a: [1, [2, 3]] }.flatten(1))
a812 = { a: [1, [2, 3]] }; c812 = (a812.flatten(1)); p c812

p({ a: [1, [2, 3]] }.flatten(2))
a813 = { a: [1, [2, 3]] }; c813 = (a813.flatten(2)); p c813

# default depth is 1: array values are NOT flattened
p({ a: [1, 2], b: [3, 4] }.flatten)
a814 = { a: [1, 2], b: [3, 4] }; c814 = (a814.flatten); p c814
# single-entry hash
p({ a: 1 }.flatten)
a815 = { a: 1 }; c815 = (a815.flatten); p c815
# empty hash
p({}.flatten)
a816 = {}; c816 = (a816.flatten); p c816
# String keys
p({ "a" => 1, "b" => 2 }.flatten)
a817 = { "a" => 1, "b" => 2 }; c817 = (a817.flatten); p c817
# Integer keys
p({ 1 => "x", 2 => "y" }.flatten)
a818 = { 1 => "x", 2 => "y" }; c818 = (a818.flatten); p c818
# explicit depth 1 equals default
p({ a: [1, 2] }.flatten(1))
a819 = { a: [1, 2] }; c819 = (a819.flatten(1)); p c819

# flatten(0) returns key/value pairs like to_a
p({ a: 1, b: 2 }.flatten(0))
za901 = { a: 1, b: 2 }; zc901 = (za901.flatten(0)); p zc901
# no-arg equals flatten(1)
p({ a: [1, 2] }.flatten == { a: [1, 2] }.flatten(1))
za902 = { a: [1, 2] }; zc902 = (za902.flatten == za902.flatten(1)); p zc902
# nested-Array value flattened deeper
p({ a: [1, [2, [3, 4]]] }.flatten(3))
za903 = { a: [1, [2, [3, 4]]] }; zc903 = (za903.flatten(3)); p zc903

# On a Hash returned by a seedless Array#reduce.
a82fl = { n: 1, s: { x: 2 } }
h82fl = [a82fl].reduce { |acc82fl, l82fl| acc82fl }
r82fl = (h82fl.flatten rescue $!.class); p r82fl
