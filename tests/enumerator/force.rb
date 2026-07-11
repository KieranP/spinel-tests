# frozen_string_literal: true
# Enumerator::Lazy#force
p([1, 2, 3].lazy.map { |x| x * 2 }.force)
v001 = [1, 2, 3].lazy.map { |x| x * 2 }.force; p(v001)
a001 = [1, 2, 3, 4]; p(a001.lazy.select { |x| x.even? }.force)
b001 = [1, 2, 3].lazy.map { |x| x + 1 }; v002 = b001.force; p(v002)
# force is equivalent to to_a on a bounded lazy chain
p((1..Float::INFINITY).lazy.take(4).force)
v003 = (1..Float::INFINITY).lazy.take(4).force; p(v003)
# force after a chained select+map
p([1, 2, 3, 4, 5].lazy.select { |x| x.odd? }.map { |x| x * x }.force)
p((1..Float::INFINITY).lazy.map { |x900| x900 * 2 }.take(3).force)
v901 = (1..Float::INFINITY).lazy.map { |x901| x901 * 2 }.take(3).force; p(v901)
