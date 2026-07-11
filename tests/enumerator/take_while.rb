# frozen_string_literal: true
# Enumerator::Lazy#take_while
p([1, 2, 3, 4, 1].lazy.take_while { |x| x < 4 }.to_a)
v001 = [1, 2, 3, 4, 1].lazy.take_while { |x| x < 4 }.to_a; p(v001)
a001 = [2, 4, 6, 7, 8]; p(a001.lazy.take_while { |x| x.even? }.to_a)
b001 = [1, 2, 3, 4].lazy.take_while { |x| x < 3 }; p(b001.force)
# take_while truncating an infinite source
p((1..Float::INFINITY).lazy.take_while { |x| x <= 5 }.to_a)
v002 = (1..Float::INFINITY).lazy.take_while { |x| x <= 5 }.to_a; p(v002)
# take_while chained after map
p((1..Float::INFINITY).lazy.map { |x| x * 2 }.take_while { |x| x < 10 }.to_a)
# eager Enumerator#take_while over a finite source
p([1, 2, 3].each.take_while { |x900| x900 < 3 })
v901 = [1, 2, 3].each.take_while { |x901| x901 < 3 }; p(v901)
p(Enumerator.new { |y| y << 1; y << 2 }.take_while { |n902| n902 < 2 })
# eager take_while over an infinite generator
p(Enumerator.new { |y| i903 = 0; loop { y << (i903 += 1) } }.take_while { |n903| n903 < 4 })
