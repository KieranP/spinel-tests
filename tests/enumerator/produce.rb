# frozen_string_literal: true
# Enumerator.produce
p(Enumerator.produce(1) { |n| n + 1 }.first(3))
v053 = Enumerator.produce(1) { |n| n + 1 }; p(v053.first(3))
a053 = Enumerator.produce(0) { |n| n + 2 }; p(a053.first(4))
p(Enumerator.produce(1) { |n| n * 2 }.take(4))
p(Enumerator.produce("a") { |s| s + "a" }.take(3))
# a block that raises StopIteration bounds the sequence
p(Enumerator.produce(1) { |n| raise StopIteration if n >= 4; n + 1 }.to_a)
# produce feeding a lazy chain
p(Enumerator.produce(1) { |n| n * 3 }.lazy.select { |n| n > 5 }.first(2))
v100 = Enumerator.produce(1) { |n| n + 1 }.lazy.map { |x| x * 2 }.first(3); p(v100)
p(Enumerator.produce(1) { |n| n + 1 }.lazy.take_while { |n| n < 5 }.to_a)
# an Array state carried through a single block parameter
p(Enumerator.produce([0, 1]) { |pair| [pair[1], pair[0] + pair[1]] }.take(5))
# the same state destructured into two block parameters
p(Enumerator.produce([0, 1]) { |a101, b101| [b101, a101 + b101] }.take(5))
# eager take_while over the infinite sequence
p(Enumerator.produce(1) { |n| n + 1 }.take_while { |n| n < 5 })
# produce with no initial value passes nil to the first call
# p(Enumerator.produce { |prev| prev.nil? ? 1 : prev + 1 }.first(3))           # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(Enumerator.produce(1) { |n| n + 1 }.each_slice(2).first(2))                # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
