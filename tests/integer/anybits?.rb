# frozen_string_literal: true
# Integer#anybits?
p(14.anybits?(6))
a344 = 14; p(a344.anybits?(6))
a345 = 14; b345 = 6; p(a345.anybits?(b345))
a346 = 14; b346 = 6; c346 = (a346.anybits?(b346)); p c346

p(14.anybits?(0))
p(15.anybits?(15))
p(14.anybits?(1))
p(14.anybits?(7))
p((-1).anybits?(6))
an01 = -8; p(an01.anybits?(4))
an02 = 14; anm2 = 2 ** 100; can02 = (an02.anybits?(anm2)); p can02
p((2 ** 100).anybits?(2 ** 100))
