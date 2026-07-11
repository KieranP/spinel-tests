# frozen_string_literal: true
# Range#take
p((1..5).take(3))
v009 = (1..5).take(3); p(v009)
p((1..).take(3))
v010 = (1..).take(3); p(v010)
p((1..5).take(0))
p((1..5).take(10))
p((1...5).take(2))
p((5..1).take(3))
p(("a".."e").take(2))
a011 = ("a".."e"); v011 = a011.take(3); p(v011)
