# frozen_string_literal: true
# Integer#numerator
p(5.numerator)
p((-5).numerator)
a001 = 5; p(a001.numerator)
a002 = 5; c002 = (a002.numerator); p c002

p(0.numerator)
a003 = -5; p(a003.numerator)
a004 = -5; c004 = (a004.numerator); p c004

# Bignum receiver (numerator is the Bignum itself):
p((10 ** 30).numerator)
x005 = 10 ** 30; p(x005.numerator)
x006 = 10 ** 30; c006 = (x006.numerator); p c006
