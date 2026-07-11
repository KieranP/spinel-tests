# frozen_string_literal: true
# Enumerator#sum / Enumerator::Lazy#sum
p([1, 2, 3].each.sum)
v001 = [1, 2, 3].each.sum; p(v001)
a002 = [1, 2, 3]; p(a002.each.sum)
p((1..4).each.sum)
p([1, 2, 3].each.sum(10))
p(Enumerator.new { |y| y << 1; y << 2 }.sum)
p([1, 2, 3].lazy.sum)
v003 = [1, 2, 3].lazy.sum; p(v003)
p([1, 2, 3].lazy.map { |x| x * 2 }.sum)
