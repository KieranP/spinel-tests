# frozen_string_literal: true
# Enumerator::Lazy#flat_map
p([1, 2, 3].lazy.flat_map { |x| [x, x] }.to_a)
v001 = [1, 2, 3].lazy.flat_map { |x| [x, x] }.to_a; p(v001)
a001 = [1, 2, 3]; p(a001.lazy.flat_map { |x| [x, -x] }.to_a)
b001 = [1, 2, 3].lazy.flat_map { |x| [x * 10, x * 100] }; p(b001.first(3))
# flat_map truncating an infinite source
p((1..Float::INFINITY).lazy.flat_map { |x| [x, x] }.first(4))
v002 = (1..Float::INFINITY).lazy.flat_map { |x| [x, x] }.first(4); p(v002)
# force terminator, result captured
p([1, 2].lazy.flat_map { |x| [x, x + 1] }.force)
v003 = [1, 2].lazy.flat_map { |x| [x, x + 1] }.force; p(v003)
