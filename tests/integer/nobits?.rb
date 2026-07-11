# frozen_string_literal: true
# Integer#nobits?
p(14.nobits?(1))
a347 = 14; p(a347.nobits?(1))
a348 = 14; b348 = 1; p(a348.nobits?(b348))
a349 = 14; b349 = 1; c349 = (a349.nobits?(b349)); p c349

p(14.nobits?(0))
p(15.nobits?(15))
p(14.nobits?(7))
p(8.nobits?(4))
p((-1).nobits?(6))
nb01 = -8; p(nb01.nobits?(4))
nb02 = 14; nbm2 = 2 ** 100; cnb02 = (nb02.nobits?(nbm2)); p cnb02
p((2 ** 100).nobits?(1))
