# frozen_string_literal: true
# Hash#length

p({}.length)
p({ a: 1 }.length)
p({ a: 1, b: 2 }.length)
p({ a: 1, b: 2, c: 3 }.length)
p({ "x" => 1, "y" => 2 }.length)
p({ 1 => "one", 2 => "two", 3 => "three" }.length)
p({ a: { x: 1 }, b: [1, 2], c: nil }.length)

a001 = {}; r001 = a001.length; p r001
a002 = { a: 1 }; r002 = a002.length; p r002
a003 = { a: 1, b: 2 }; r003 = a003.length; p r003
a004 = { "x" => 1.1, "y" => 2.2, "z" => 3.3 }; r004 = a004.length; p r004
a005 = { 1 => "one", 2 => "two" }; r005 = a005.length; p r005
