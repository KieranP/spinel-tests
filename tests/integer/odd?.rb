# frozen_string_literal: true
# Integer#odd?
p(3.odd?)
a100 = 3; p(a100.odd?)
a101 = 3; c101 = (a101.odd?); p c101

p(4.odd?)
p(0.odd?)
p((-3).odd?)
p((-4).odd?)
a102 = 8; c102 = (a102.odd?); p c102

x110o = 2 ** 100; p(x110o.odd?)
x110p = 2 ** 100; c110p = (x110p.odd?); p c110p
p((2 ** 100 + 1).odd?)
