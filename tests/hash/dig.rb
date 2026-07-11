# frozen_string_literal: true
# Hash#dig
p({ a: { b: 1 } }.dig(:a, :b))
a013 = { a: { b: 1 } }; p(a013.dig(:a, :b))
a014 = { a: { b: 1 } }; b014 = :a; p(a014.dig(b014, :b))
a015 = { a: { b: 1 } }; b015 = :a; c015 = (a015.dig(b015, :b)); p c015
# deeper nesting
p({ a: { b: { c: 7 } } }.dig(:a, :b, :c))
d01 = { a: { b: { c: 7 } } }; e01 = (d01.dig(:a, :b, :c)); p e01
# dig into a nested array
p({ a: [10, 20] }.dig(:a, 1))
d02 = { a: [10, 20] }; e02 = (d02.dig(:a, 1)); p e02
# missing key -> nil
p({ a: 1 }.dig(:z))
d03 = { a: 1 }; e03 = (d03.dig(:z)); p e03
# String keys
p({ "a" => { "b" => 5 } }.dig("a", "b"))
d04 = { "a" => { "b" => 5 } }; e04 = (d04.dig("a", "b")); p e04
# Integer keys, nested-Array value (works)
p({ 1 => [10, 20] }.dig(1, 0))
d05 = { 1 => [10, 20] }; e05 = (d05.dig(1, 0)); p e05
p({ 1 => { 2 => 3 } }.dig(1, 2))
d07 = { 1 => { 2 => 3 } }; e07 = (d07.dig(1, 2)); p e07
# single key present
p({ a: 1 }.dig(:a))
d06 = { a: 1 }; e06 = (d06.dig(:a)); p e06

# heterogeneous nested config: dig through a Hash into an Array element
zh501 = { server: { ports: [80, 443], name: "web" }, debug: true }; zr501 = zh501.dig(:server, :ports, 1); p zr501
# dig reaching a String value in the same mixed structure
zh502 = { server: { ports: [80, 443], name: "web" }, debug: true }; zr502 = zh502.dig(:server, :name); p zr502
# dig short-circuits on an intermediate nil value
zh503 = { a: { b: nil } }; zr503 = zh503.dig(:a, :b); p zr503

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hd(ohd)
  case ohd
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hd = (raisebr_hd("ab").dig("b") rescue $!.class); p rb_hd

# Hash#dig with a splatted Array of keys, monomorphic receiver.
hd90 = { server: { host: "x" } }
k90 = [:server, :host]
p(hd90.dig(*k90))
v90 = hd90.dig(*k90); p v90
# the non-splatted call on the same Hash is fine
p(hd90.dig(:server, :host))
v91 = hd90.dig(:server, :host); p v91

# On a Hash returned by a seedless Array#reduce.
a82dg = { n: 1, s: { x: 2 } }
h82dg = [a82dg].reduce { |acc82dg, l82dg| acc82dg }
r82dg = (h82dg.dig(:s, :x) rescue $!.class); p r82dg

# a splatted key list whose receiver is shared with an Array call site
def dig94(config, keys); config.dig(*keys); end
p(dig94({ a: { b: 1 } }, [:a, :b]))
v94 = dig94([[1, 2]], [0, 1]); p v94

# Digging through a value that has no #dig returns nil instead of raising.
r831 = ({ a: 1 }.dig(:a, :b) rescue $!.class); p r831
r832 = ({ a: "x" }.dig(:a, :b) rescue $!.class); p r832
r833 = ({ a: { b: 1 } }.dig(:a, :b, :c) rescue $!.class); p r833
h834 = { "a" => 1 }; r834 = (h834.dig("a", "b") rescue $!.class); p r834
# Control: digging past a missing key or past an explicit nil is nil.
p({ a: 1 }.dig(:z, :b))
r835 = ({ a: { b: nil } }.dig(:a, :b)); p r835

# dig reaching an Array value out of a {}-built Hash
h836 = {}; h836["a"] = [7, 8, 9]; r836 = h836.dig("a"); p r836; p r836[0]
# dig into a nested Hash built by successive []=
h837 = {}; h837["a"] = {}; h837["a"]["b"] = 1; p h837.dig("a", "b")
r837 = h837.dig("a", "b"); p r837

# a Data value is not diggable in Ruby either
D838 = Data.define(:v)
h838 = { k: D838.new(2) }
r838 = (h838.dig(:k, :v) rescue $!.class); p r838
