# frozen_string_literal: true
# Hash#keys

p({ a: 1, b: 2 }.keys)

a001 = { a: 1, b: 2 }
p a001.class
p a001.keys

a002 = { a: 1, b: 2 }
c002 = a002.keys
p c002.class
p c002

p({ "x" => 1.1, "y" => 2.2 }.keys)

a003 = { "x" => 1.1, "y" => 2.2 }
p a003.class
p a003.keys

a004 = { "x" => 1.1, "y" => 2.2 }
c004 = a004.keys
p c004.class
p c004

p({ 1 => "one", 2 => "two" }.keys)

a005 = { 1 => "one", 2 => "two" }
p a005.class
p a005.keys

a006 = { 1 => "one", 2 => "two" }
c006 = a006.keys
p c006.class
p c006

# single-entry hash
p({ a: 1 }.keys)
a007 = { a: 1 }; c007 = a007.keys; p c007

# nested-hash values, symbol keys
p({ a: { x: 1 }, b: { y: 2 } }.keys)
a008 = { a: { x: 1 }, b: { y: 2 } }; c008 = a008.keys; p c008

# array values, symbol keys
p({ a: [1, 2], b: [3] }.keys)
a009 = { a: [1, 2], b: [3] }; c009 = a009.keys; p c009

# nil values, symbol keys
p({ a: nil, b: nil }.keys)
a010 = { a: nil, b: nil }; c010 = a010.keys; p c010

# larger integer-keyed hash
p({ 1 => "a", 2 => "b", 3 => "c", 4 => "d" }.keys)
a011 = { 1 => "a", 2 => "b", 3 => "c", 4 => "d" }; c011 = a011.keys; p c011

# empty hash
p({}.keys)
a012 = {}; c012 = a012.keys; p c012

# `keys || []` — the nil-guard fallback — emits ill-typed C (the empty array
# literal is always built as an Integer array).
zk20 = { "a" => 1 }
p(zk20.keys || [])
zk21 = zk20.keys
p(zk21 || [])
# a non-empty literal of the matching type is clean
p(zk20.keys || ["z"])

# Safe-navigating to #keys aborts the C build.
zk30 = [{ "a" => 1 }]
p(zk30.first&.keys)
zk31 = [{ "a" => 1 }]
zk32 = zk31.first&.keys
p zk32
# a Hash-typed receiver is fine
p({ "a" => 1 }&.keys)
