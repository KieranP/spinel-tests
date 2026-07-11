# frozen_string_literal: true
# Hash#to_s
p({ a: 1 }.to_s)
a035 = { a: 1 }; p(a035.to_s)
a036 = { a: 1 }; v036 = a036.to_s; p v036
# to_s equals inspect
p({ a: 1, b: 2 }.to_s == { a: 1, b: 2 }.inspect)
a037s = { a: 1, b: 2 }; c037s = (a037s.to_s == a037s.inspect); p c037s
# multi-entry hash
p({ a: 1, b: 2, c: 3 }.to_s)
a038s = { a: 1, b: 2, c: 3 }; c038s = (a038s.to_s); p c038s
# empty hash
p({}.to_s)
a039s = {}; c039s = (a039s.to_s); p c039s
# nested hash
p({ a: { b: 1 } }.to_s)
a040s = { a: { b: 1 } }; c040s = (a040s.to_s); p c040s
# String keys
p({ "a" => 1 }.to_s)
a041s = { "a" => 1 }; c041s = (a041s.to_s); p c041s
# Integer keys
p({ 1 => "x", 2 => "y" }.to_s)
a042s = { 1 => "x", 2 => "y" }; c042s = (a042s.to_s); p c042s
# mixed value types
p({ a: 1, b: "s", c: :sym }.to_s)
a043s = { a: 1, b: "s", c: :sym }; c043s = (a043s.to_s); p c043s

# Array values
p({ a: [1, 2], b: [3] }.to_s)
za930 = { a: [1, 2], b: [3] }; zc930 = (za930.to_s); p zc930
# nested hash equals inspect
p({ a: { b: 1 } }.to_s == { a: { b: 1 } }.inspect)
za931 = { a: { b: 1 } }; zc931 = (za931.to_s == za931.inspect); p zc931
