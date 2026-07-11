# frozen_string_literal: true
# Hash#select!
p({ a: 1, b: 2, c: 3 }.select! { |_k, v| v > 1 })
a001 = { a: 1, b: 2, c: 3 }; a001.select! { |_k, v| v > 1 }; p a001
b001 = { a: 1, b: 2, c: 3 }; c001 = (b001.select! { |_k, v| v > 1 }); p c001

# returns nil when nothing changed
p({ a: 1, b: 2 }.select! { |_k, _v| true })
a002 = { a: 1, b: 2 }; c002 = (a002.select! { |_k, _v| true }); p c002; p a002

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.select! { |_k, v| v >= 10 })
a003 = { "x" => 10, "y" => 20, "z" => 5 }; a003.select! { |_k, v| v >= 10 }; p a003
b003 = { "x" => 10, "y" => 20, "z" => 5 }; c003 = (b003.select! { |_k, v| v >= 10 }); p c003

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.select! { |k, _v| k.odd? })
a004 = { 1 => "a", 2 => "b", 3 => "c" }; a004.select! { |k, _v| k.odd? }; p a004
b004 = { 1 => "a", 2 => "b", 3 => "c" }; c004 = (b004.select! { |k, _v| k.odd? }); p c004

# keep nothing
p({ a: 1, b: 2 }.select! { |_k, v| v > 100 })
a005 = { a: 1, b: 2 }; a005.select! { |_k, v| v > 100 }; p a005
b005 = { a: 1, b: 2 }; c005 = (b005.select! { |_k, v| v > 100 }); p c005

# single-entry hash, all kept -> nil
a006 = { only: 1 }; c006 = (a006.select! { |_k, v| v > 0 }); p c006; p a006
