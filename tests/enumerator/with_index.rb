# frozen_string_literal: true
# Enumerator#with_index
[10, 20].each.with_index(1) { |x, i| p [x, i] }
p([10, 20].map.with_index(1) { |x, i| [x, i] })
v011 = [10, 20].map.with_index(1) { |x, i| [x, i] }; p(v011)
p([1, 2, 3].map.with_index { |x, i| [x, i] })
v012 = [1, 2, 3].map.with_index { |x, i| [x, i] }; p(v012)
e007 = [1, 2, 3].each; e007.with_index(10) { |x, i| p [x, i] }
e008 = [1, 2, 3].each; v013 = e008.with_index(10) { |x, i| [x, i] }; p(v013)
# with_index with no offset defaults to 0
p([10, 20, 30].each.with_index { |x, i| [x, i] })
# with_index with no block returns an Enumerator — materialize it
p([10, 20, 30].map.with_index.to_a)
p([10, 20].each.with_index(1).to_a)
p([1, 2, 3].each.with_index.to_a)
# with_index on a literal map enumerator, result captured
p([1, 2, 3].map.with_index(1) { |x, i| x * i })
v059 = [1, 2, 3].map.with_index(1) { |x, i| x * i }; p(v059)
# capturing with_index's return value on a map enumerator held in a variable
a059 = [1, 2, 3].map; v060 = a059.with_index(1) { |x, i| x * i }; p(v060)
p([10, 20, 30].lazy.with_index.to_a)
v061 = [10, 20, 30].lazy.with_index.to_a; p(v061)
r062 = ((1..10).select.with_index { |v, i| i.even? } rescue $!.class); p r062
r063 = ((1..4).each.with_index(5).to_a rescue $!.class); p r063
r064 = (4.times.with_index(1).to_a rescue $!.class); p r064
p(4.times.with_index(1) { |x, i| x })
p([1, 2, 3].lazy.with_index(5) { |x900, i900| x900 * i900 }.to_a)
v901 = [1, 2, 3].lazy.with_index(5) { |x901, i901| x901 * i901 }.to_a; p(v901)
# with_index over an infinite lazy source, and on a map Enumerator receiver
# p((1..Float::INFINITY).lazy.with_index(1).first(3))       # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p([1, 2, 3].each.map.with_index { |x902, i902| [x902, i902] })   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# Struct constructor aborts the C build when another site builds it with a literal Integer.
WiPair903 = Struct.new(:number, :label)
a903 = []; "a\nb\n".each_line.with_index { |r903, i903| a903 << WiPair903.new(i903, r903.to_s) }
p a903.map(&:number)
p WiPair903.new(99, "x").number
v904 = []; "ab".each_byte.with_index { |r904, i904| v904 << WiPair903.new(i904, r904.to_s) }
p v904.map(&:number)
