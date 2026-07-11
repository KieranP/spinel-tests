# frozen_string_literal: true
# Enumerator::Lazy#drop_while
p([1, 2, 3, 4, 1].lazy.drop_while { |x| x < 3 }.to_a)
v001 = [1, 2, 3, 4, 1].lazy.drop_while { |x| x < 3 }.to_a; p(v001)
a001 = [2, 4, 5, 6]; p(a001.lazy.drop_while { |x| x.even? }.to_a)
b001 = [1, 2, 3, 4].lazy.drop_while { |x| x < 3 }; p(b001.force)
# drop_while then first on an infinite source
p((1..Float::INFINITY).lazy.drop_while { |x| x < 4 }.first(3))
v002 = (1..Float::INFINITY).lazy.drop_while { |x| x < 4 }.first(3); p(v002)
# drop_while chained after map
p((1..Float::INFINITY).lazy.map { |x| x * 2 }.drop_while { |x| x < 6 }.first(3))
