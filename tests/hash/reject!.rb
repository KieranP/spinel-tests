# frozen_string_literal: true
# Hash#reject!
p({ a: 1, b: 2, c: 3 }.reject! { |_k, v| v > 1 })
a001 = { a: 1, b: 2, c: 3 }; a001.reject! { |_k, v| v > 1 }; p a001
b001 = { a: 1, b: 2, c: 3 }; c001 = (b001.reject! { |_k, v| v > 1 }); p c001

# returns nil when nothing changed
p({ a: 1, b: 2 }.reject! { |_k, _v| false })
a002 = { a: 1, b: 2 }; c002 = (a002.reject! { |_k, _v| false }); p c002; p a002

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.reject! { |_k, v| v >= 10 })
a003 = { "x" => 10, "y" => 20, "z" => 5 }; a003.reject! { |_k, v| v >= 10 }; p a003
b003 = { "x" => 10, "y" => 20, "z" => 5 }; c003 = (b003.reject! { |_k, v| v >= 10 }); p c003

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.reject! { |k, _v| k.odd? })
a004 = { 1 => "a", 2 => "b", 3 => "c" }; a004.reject! { |k, _v| k.odd? }; p a004
b004 = { 1 => "a", 2 => "b", 3 => "c" }; c004 = (b004.reject! { |k, _v| k.odd? }); p c004

# reject everything
p({ a: 1, b: 2 }.reject! { |_k, v| v > 0 })
a005 = { a: 1, b: 2 }; a005.reject! { |_k, v| v > 0 }; p a005
b005 = { a: 1, b: 2 }; c005 = (b005.reject! { |_k, v| v > 0 }); p c005

# single-entry hash, none rejected -> nil
a006 = { only: 1 }; c006 = (a006.reject! { |_k, v| v > 100 }); p c006; p a006
