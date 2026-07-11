# frozen_string_literal: true
# Enumerator::Lazy#map
p([1, 2, 3].lazy.map { |x| x * 2 }.to_a)
v001 = [1, 2, 3].lazy.map { |x| x * 2 }.to_a; p(v001)
a001 = [1, 2, 3]; p(a001.lazy.map { |x| x + 1 }.to_a)
b001 = [10, 20, 30].lazy.map { |x| x / 10 }; p(b001.first(2))
# infinite source truncated by first
p((1..Float::INFINITY).lazy.map { |x| x * x }.first(4))
v002 = (1..Float::INFINITY).lazy.map { |x| x * x }.first(4); p(v002)
# endless range source
p((1..).lazy.map { |x| x + 100 }.first(3))
# force terminator
p([1, 2, 3].lazy.map { |x| x - 1 }.force)
v003 = [1, 2, 3].lazy.map { |x| x - 1 }.force; p(v003)
# chained maps
p((1..Float::INFINITY).lazy.map { |x| x * 2 }.map { |x| x + 1 }.first(3))
# lazy over a string-char / times / hash source
p("abc".each_char.lazy.map { |c| c.upcase }.to_a)
p(3.times.lazy.map { |x| x * 5 }.to_a)
# lazy over an empty array literal
p([].lazy.map { |x| x * 2 }.to_a)
