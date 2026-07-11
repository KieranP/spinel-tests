# frozen_string_literal: true
# Enumerator::Lazy#reject
p([1, 2, 3, 4].lazy.reject { |x| x.even? }.to_a)
v001 = [1, 2, 3, 4].lazy.reject { |x| x.even? }.to_a; p(v001)
a001 = [1, 2, 3, 4, 5]; p(a001.lazy.reject { |x| x > 3 }.to_a)
b001 = [1, 2, 3, 4].lazy.reject { |x| x.odd? }; p(b001.first(1))
# infinite source truncated by first
p((1..Float::INFINITY).lazy.reject { |x| x.even? }.first(3))
v002 = (1..Float::INFINITY).lazy.reject { |x| x.even? }.first(3); p(v002)
# force terminator, result captured
p([1, 2, 3, 4].lazy.reject { |x| x < 3 }.force)
v003 = [1, 2, 3, 4].lazy.reject { |x| x < 3 }.force; p(v003)
p([].lazy.reject { |x| true }.to_a)
