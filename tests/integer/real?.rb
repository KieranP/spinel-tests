# frozen_string_literal: true
# Integer#real?
p(5.real?)
p(0.real?)
p((-5).real?)
a001 = 5; p(a001.real?)
b001 = -5; c001 = b001.real?; p c001
d001 = 2 ** 40; c002 = d001.real?; p c002
