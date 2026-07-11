# frozen_string_literal: true
# Hash#key

p({ a: 1, b: 2 }.key(2))
p({ a: 1, b: 2 }.key(1))
p({ a: 1, b: 2 }.key(99))
p({ a: 1, b: 1 }.key(1))
p({ a: "one", b: "two" }.key("two"))
p({ a: 1.1, b: 2.2 }.key(2.2))

a001 = { a: 1, b: 2 }; r001 = a001.key(2); p r001
a002 = { a: 1, b: 2 }; r002 = a002.key(99); p r002
a005 = { a: 1 }; r005 = a005.key(1); p r005

# argument in a variable
b001 = { a: 1, b: 2, c: 3 }; arg001 = 3; r006 = b001.key(arg001); p r006

# non-Symbol-keyed hashes
p({ "x" => 10, "y" => 20 }.key(20))
p({ 1 => "one", 2 => "two" }.key("two"))
a003 = { "x" => 1.1, "y" => 2.2 }; r003 = a003.key(2.2); p r003
a004 = { 1 => "one", 2 => "two" }; r004 = a004.key("one"); p r004
