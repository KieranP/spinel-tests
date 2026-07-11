# frozen_string_literal: true
# Enumerator::Lazy#drop
p([1, 2, 3, 4, 5].lazy.drop(2).to_a)
v001 = [1, 2, 3, 4, 5].lazy.drop(2).to_a; p(v001)
a001 = [10, 20, 30, 40]; p(a001.lazy.drop(1).to_a)
b001 = [1, 2, 3, 4].lazy.drop(2); p(b001.force)
# drop then first on an infinite source
p((1..Float::INFINITY).lazy.drop(3).first(3))
v002 = (1..Float::INFINITY).lazy.drop(3).first(3); p(v002)
# drop more than available
p([1, 2].lazy.drop(5).to_a)
# drop chained after map
p((1..Float::INFINITY).lazy.map { |x| x * 2 }.drop(2).first(3))
