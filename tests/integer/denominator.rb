# frozen_string_literal: true
# Integer#denominator
p(5.denominator)
p((-5).denominator)
a001 = 5; p(a001.denominator)
a002 = 5; c002 = (a002.denominator); p c002

p(0.denominator)
a003 = -5; p(a003.denominator)
a004 = -5; c004 = (a004.denominator); p c004

# Bignum receiver (denominator always 1):
p((10 ** 30).denominator)
x005 = 10 ** 30; p(x005.denominator)
x006 = 10 ** 30; c006 = (x006.denominator); p c006
