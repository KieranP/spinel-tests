# frozen_string_literal: true
# Enumerator::Lazy#select
p([1, 2, 3, 4].lazy.select { |x| x.even? }.to_a)
v001 = [1, 2, 3, 4].lazy.select { |x| x.even? }.to_a; p(v001)
a001 = [1, 2, 3, 4, 5]; p(a001.lazy.select { |x| x > 2 }.to_a)
b001 = [1, 2, 3, 4].lazy.select { |x| x.odd? }; p(b001.first(1))
# infinite source truncated by first
p((1..Float::INFINITY).lazy.select { |x| x % 3 == 0 }.first(3))
v002 = (1..Float::INFINITY).lazy.select { |x| x % 3 == 0 }.first(3); p(v002)
# force terminator, result captured
p([1, 2, 3, 4].lazy.select { |x| x <= 2 }.force)
v003 = [1, 2, 3, 4].lazy.select { |x| x <= 2 }.force; p(v003)
# chained select + map
p((1..Float::INFINITY).lazy.select { |x| x.even? }.map { |x| x * 10 }.first(3))
p([].lazy.select { |x| true }.to_a)
