# frozen_string_literal: true
# Integer#infinite?
p(5.infinite?)
p(0.infinite?)
p((-5).infinite?)
a001 = 5; p(a001.infinite?)
b001 = -5; c001 = b001.infinite?; p c001
d001 = 2 ** 40; c002 = d001.infinite?; p c002
