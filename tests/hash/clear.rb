# frozen_string_literal: true
# Hash#clear

# mutate-in-place form
a001 = { a: 1, b: 2 }; a001.clear; p a001
a002 = { "x" => 1, "y" => 2 }; a002.clear; p a002
a003 = { 1 => "one", 2 => "two" }; a003.clear; p a003
a004 = { a: 1 }; a004.clear; p a004
a005 = { a: { x: 1 }, b: [1, 2] }; a005.clear; p a005

# size after clear
d001 = { a: 1, b: 2, c: 3 }; d001.clear; p d001.size

# return value is self (the now-empty hash)
b001 = { a: 1, b: 2 }; r001 = b001.clear; p r001
b002 = { "x" => 1.1, "y" => 2.2 }; r002 = b002.clear; p r002

# clearing an already-empty hash
c001 = {}; c001.clear; p c001
c002 = {}; r003 = c002.clear; p r003
