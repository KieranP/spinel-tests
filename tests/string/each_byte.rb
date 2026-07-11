# frozen_string_literal: true
# String#each_byte
p("abc".each_byte.to_a)
a051 = "abc"; p(a051.each_byte.to_a)
a052 = "abc"; c052 = (a052.each_byte.to_a); p c052
# one entry per byte on a multibyte receiver (more than the character count)
p("café".each_byte.to_a)
p("☕".each_byte.to_a)
a055 = "héllo"; c055 = (a055.each_byte.to_a); p c055
a056 = "café"; v056 = (a056.each_byte.to_a.length); p v056
# block form collects the raw bytes
r057 = []; "é".each_byte { |b057| r057 << b057 }; p r057
a058 = "é"; s058 = []; a058.each_byte { |b| s058 << b }; p s058

# A blockless each_byte on a String destructured out of an Array yields an untyped
# receiver: `reduce` raises NoMethodError and `sum` silently returns nil.
pr801 = [0, "hello"]; i801, t801 = pr801
r801 = (t801.each_byte.reduce(0) { |a801, b801| a801 + b801 } rescue $!.class); p r801
pr802 = [0, "hello"]; i802, t802 = pr802
r802 = (t802.each_byte.to_a rescue $!.class); p r802
pr803 = [0, "hello"]; i803, t803 = pr803
r803 = (t803.each_byte.sum rescue $!.class); p r803
# Struct constructor aborts the C build when another site builds it with a literal Integer.
EbPair906 = Struct.new(:number, :label)
a906 = []; "ab".each_byte.with_index { |r906, i906| a906 << EbPair906.new(i906, r906.to_s) }
p a906.map(&:number)
p EbPair906.new(99, "x").number
