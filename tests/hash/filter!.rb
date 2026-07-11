# frozen_string_literal: true
# Hash#filter!
p({ a: 1, b: 2, c: 3 }.filter! { |_k, v| v > 1 })
a001 = { a: 1, b: 2, c: 3 }; a001.filter! { |_k, v| v > 1 }; p a001
b001 = { a: 1, b: 2, c: 3 }; c001 = (b001.filter! { |_k, v| v > 1 }); p c001

# returns nil when nothing changed
p({ a: 1, b: 2 }.filter! { |_k, _v| true })
a002 = { a: 1, b: 2 }; c002 = (a002.filter! { |_k, _v| true }); p c002; p a002

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.filter! { |_k, v| v >= 10 })
a003 = { "x" => 10, "y" => 20, "z" => 5 }; a003.filter! { |_k, v| v >= 10 }; p a003
b003 = { "x" => 10, "y" => 20, "z" => 5 }; c003 = (b003.filter! { |_k, v| v >= 10 }); p c003

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.filter! { |k, _v| k.odd? })
a004 = { 1 => "a", 2 => "b", 3 => "c" }; a004.filter! { |k, _v| k.odd? }; p a004
b004 = { 1 => "a", 2 => "b", 3 => "c" }; c004 = (b004.filter! { |k, _v| k.odd? }); p c004

# keep nothing
p({ a: 1, b: 2 }.filter! { |_k, v| v > 100 })
a005 = { a: 1, b: 2 }; a005.filter! { |_k, v| v > 100 }; p a005
b005 = { a: 1, b: 2 }; c005 = (b005.filter! { |_k, v| v > 100 }); p c005

# single-entry hash, all kept -> nil
a006 = { only: 1 }; c006 = (a006.filter! { |_k, v| v > 0 }); p c006; p a006
