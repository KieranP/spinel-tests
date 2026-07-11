# frozen_string_literal: true
# Enumerator::Lazy#filter
p([1, 2, 3, 4].lazy.filter { |x| x.even? }.to_a)
v001 = [1, 2, 3, 4].lazy.filter { |x| x.even? }.to_a; p(v001)
a001 = [5, 6, 7, 8]; p(a001.lazy.filter { |x| x > 6 }.to_a)
b001 = [1, 2, 3, 4].lazy.filter { |x| x.odd? }; p(b001.first(2))
# infinite source truncated by first
p((1..Float::INFINITY).lazy.filter { |x| x % 5 == 0 }.first(3))
v002 = (1..Float::INFINITY).lazy.filter { |x| x % 5 == 0 }.first(3); p(v002)
# force terminator, result captured
p([1, 2, 3, 4].lazy.filter { |x| x >= 3 }.force)
v003 = [1, 2, 3, 4].lazy.filter { |x| x >= 3 }.force; p(v003)
