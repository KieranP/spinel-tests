# frozen_string_literal: true
# Hash#replace
p({ a: 1 }.replace({ b: 2, c: 3 }))
a001 = { a: 1 }; a001.replace({ b: 2, c: 3 }); p a001
b001 = { a: 1 }; c001 = (b001.replace({ b: 2, c: 3 })); p c001

# String keys, Integer values
p({ "x" => 10 }.replace({ "y" => 20, "z" => 30 }))
a002 = { "x" => 10 }; a002.replace({ "y" => 20, "z" => 30 }); p a002
b002 = { "x" => 10 }; c002 = (b002.replace({ "y" => 20, "z" => 30 })); p c002

# Integer keys
p({ 1 => "a", 2 => "b" }.replace({ 9 => "z" }))
a003 = { 1 => "a", 2 => "b" }; a003.replace({ 9 => "z" }); p a003
b003 = { 1 => "a", 2 => "b" }; c003 = (b003.replace({ 9 => "z" })); p c003

# replace from a variable argument
d004 = { c: 30, d: 40 }; a004 = { a: 1, b: 2 }; a004.replace(d004); p a004
e004 = { c: 30, d: 40 }; b004 = { a: 1, b: 2 }; c004 = (b004.replace(e004)); p c004

# single-entry replaces multi-entry
p({ a: 1, b: 2, c: 3 }.replace({ z: 99 }))
a005 = { a: 1, b: 2, c: 3 }; a005.replace({ z: 99 }); p a005
b005 = { a: 1, b: 2, c: 3 }; c005 = (b005.replace({ z: 99 })); p c005
