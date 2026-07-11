# frozen_string_literal: true
# Integer#rect
p(5.rect)
p(0.rect)
p((-5).rect)
p(5.rect.class)
a001 = 5; p(a001.rect)
b001 = -5; c001 = b001.rect; p c001
d001 = 2 ** 40; p(d001.rect)
