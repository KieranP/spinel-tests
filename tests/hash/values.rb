# frozen_string_literal: true
# Hash#values
p({ a: 1, b: 2 }.values)
a073 = { a: 1, b: 2 }; p(a073.values)
a074 = { a: 1, b: 2 }; c074 = (a074.values); p c074

# string values
p({ a: "x", b: "y" }.values)
a075 = { a: "x", b: "y" }; c075 = a075.values; p c075

# float values
p({ a: 1.1, b: 2.2 }.values)
a076 = { a: 1.1, b: 2.2 }; c076 = a076.values; p c076

# nil values
p({ a: nil, b: nil }.values)
a077 = { a: nil, b: nil }; c077 = a077.values; p c077

# nested-array values
p({ a: [1, 2], b: [3] }.values)
a078 = { a: [1, 2], b: [3] }; c078 = a078.values; p c078

# nested-hash values
p({ a: { x: 1 }, b: { y: 2 } }.values)
a079 = { a: { x: 1 }, b: { y: 2 } }; c079 = a079.values; p c079

# string-keyed integer values
p({ "x" => 1, "y" => 2 }.values)
a080 = { "x" => 1, "y" => 2 }; c080 = a080.values; p c080

# single-entry hash
p({ a: 42 }.values)
a081 = { a: 42 }; c081 = a081.values; p c081

# empty hash
p({}.values)
a082 = {}; c082 = a082.values; p c082

# Array-of-Symbol values, then to_s each (nested-element to_s)
p({ a: [:s, :t], b: [:u] }.values.map(&:to_s))
a083 = { a: [:s, :t], b: [:u] }; c083 = a083.values.map(&:to_s); p c083
# contrast: Array-of-Integer values to_s correctly (unaffected)
p({ a: [1, 2], b: [3] }.values.map(&:to_s))
a084 = { a: [1, 2], b: [3] }; c084 = a084.values.map(&:to_s); p c084

# Safe-navigating to #values aborts the C build.
zv20 = [{ "a" => 1 }]
p(zv20.first&.values)
zv21 = [{ "a" => 1 }]
zv22 = zv21.first&.values
p zv22
# a Hash-typed receiver is fine
p({ "a" => 1 }&.values)

# container values read out of #values, then indexed through a local
hv377 = {}; hv377["a"] = [7, 8]
vs377 = hv377.values; w377 = vs377[0]; p w377; p w377[0]
hn377 = {}; hn377["a"] = { "b" => 1 }
vn377 = hn377.values; x377 = vn377[0]; p x377; p x377["b"]
# values of a Hash whose values are Hashes, mapped over
p({ a: { x: 1 }, b: { x: 2 } }.values.map { |h378| h378[:x] })
r378 = { a: { x: 1 }, b: { x: 2 } }.values.map { |h| h[:x] }; p r378
