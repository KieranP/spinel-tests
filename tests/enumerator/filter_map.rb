# frozen_string_literal: true
# Enumerator::Lazy#filter_map
p([1, 2, 3, 4].lazy.filter_map { |x| x * 2 if x.even? }.to_a)
v001 = [1, 2, 3, 4].lazy.filter_map { |x| x * 2 if x.even? }.to_a; p(v001)
a001 = [1, 2, 3, 4, 5]; p(a001.lazy.filter_map { |x| x + 1 if x.odd? }.to_a)
b001 = [1, 2, 3, 4].lazy.filter_map { |x| x if x > 2 }; p(b001.first(1))
# filter_map truncating an infinite source
p((1..Float::INFINITY).lazy.filter_map { |x| x * 10 if x.even? }.first(3))
v002 = (1..Float::INFINITY).lazy.filter_map { |x| x * 10 if x.even? }.first(3); p(v002)
# force terminator, result captured
p([1, 2, 3, 4].lazy.filter_map { |x| x if x.odd? }.force)
v003 = [1, 2, 3, 4].lazy.filter_map { |x| x if x.odd? }.force; p(v003)
