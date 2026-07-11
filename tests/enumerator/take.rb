# frozen_string_literal: true
# Enumerator::Lazy#take
p([1, 2, 3, 4, 5].lazy.take(3).to_a)
v001 = [1, 2, 3, 4, 5].lazy.take(3).to_a; p(v001)
a001 = [10, 20, 30, 40]; p(a001.lazy.take(2).to_a)
b001 = [1, 2, 3, 4].lazy.take(2); p(b001.force)
# take truncating an infinite source
p((1..Float::INFINITY).lazy.take(4).to_a)
v002 = (1..Float::INFINITY).lazy.take(4).to_a; p(v002)
# take more than available
p([1, 2].lazy.take(5).to_a)
# take chained after map
p((1..Float::INFINITY).lazy.map { |x| x * 2 }.take(3).to_a)
# take over an infinite generator
p(Enumerator.new { |y| i900 = 0; loop { y << (i900 += 1) } }.take(4))
v901 = Enumerator.new { |y| i901 = 0; loop { y << (i901 += 1) } }.take(3); p(v901)
