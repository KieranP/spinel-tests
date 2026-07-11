# frozen_string_literal: true
# Hash#size

p({}.size)
p({ a: 1 }.size)
p({ a: 1, b: 2 }.size)
p({ a: 1, b: 2, c: 3 }.size)
p({ "x" => 1, "y" => 2 }.size)
p({ 1 => "one", 2 => "two", 3 => "three" }.size)
p({ a: { x: 1 }, b: [1, 2], c: nil }.size)

a001 = {}; r001 = a001.size; p r001
a002 = { a: 1 }; r002 = a002.size; p r002
a003 = { a: 1, b: 2 }; r003 = a003.size; p r003
a004 = { "x" => 1.1, "y" => 2.2, "z" => 3.3 }; r004 = a004.size; p r004
a005 = { 1 => "one", 2 => "two" }; r005 = a005.size; p r005
