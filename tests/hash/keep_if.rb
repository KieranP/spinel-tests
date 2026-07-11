# frozen_string_literal: true
# Hash#keep_if
p({ a: 1, b: 2, c: 3 }.keep_if { |_k, v| v > 1 })
a001 = { a: 1, b: 2, c: 3 }; a001.keep_if { |_k, v| v > 1 }; p a001
b001 = { a: 1, b: 2, c: 3 }; c001 = (b001.keep_if { |_k, v| v > 1 }); p c001

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.keep_if { |_k, v| v >= 10 })
a002 = { "x" => 10, "y" => 20, "z" => 5 }; a002.keep_if { |_k, v| v >= 10 }; p a002
b002 = { "x" => 10, "y" => 20, "z" => 5 }; c002 = (b002.keep_if { |_k, v| v >= 10 }); p c002

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.keep_if { |k, _v| k.odd? })
a003 = { 1 => "a", 2 => "b", 3 => "c" }; a003.keep_if { |k, _v| k.odd? }; p a003
b003 = { 1 => "a", 2 => "b", 3 => "c" }; c003 = (b003.keep_if { |k, _v| k.odd? }); p c003

# keep everything
p({ a: 1, b: 2 }.keep_if { |_k, v| v > 0 })
a004 = { a: 1, b: 2 }; a004.keep_if { |_k, v| v > 0 }; p a004
b004 = { a: 1, b: 2 }; c004 = (b004.keep_if { |_k, v| v > 0 }); p c004

# keep nothing
p({ a: 1, b: 2 }.keep_if { |_k, v| v > 100 })
a005 = { a: 1, b: 2 }; a005.keep_if { |_k, v| v > 100 }; p a005
b005 = { a: 1, b: 2 }; c005 = (b005.keep_if { |_k, v| v > 100 }); p c005

# single-entry hash
p({ only: 1 }.keep_if { |_k, v| v > 0 })
a006 = { only: 1 }; a006.keep_if { |_k, v| v > 0 }; p a006
b006 = { only: 1 }; c006 = (b006.keep_if { |_k, v| v > 0 }); p c006
