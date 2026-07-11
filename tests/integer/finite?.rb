# frozen_string_literal: true
# Integer#finite?
p(5.finite?)
p(0.finite?)
p((-5).finite?)
a001 = 5; p(a001.finite?)
b001 = -5; c001 = b001.finite?; p c001
d001 = 2 ** 40; c002 = d001.finite?; p c002
