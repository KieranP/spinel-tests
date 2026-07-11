# frozen_string_literal: true
# Integer#positive?
p(5.positive?)
p((-5).positive?)
p(0.positive?)
a001 = 5; p(a001.positive?)
a002 = -5; c002 = (a002.positive?); p c002

a003 = 0; p(a003.positive?)
a004 = 5; c004 = (a004.positive?); p c004

# Bignum receiver:
p((10 ** 30).positive?)
x005 = 10 ** 30; p(x005.positive?)
x006 = 10 ** 30; c006 = (x006.positive?); p c006

# Negative Bignum:
p((1 - 2 ** 100).positive?)
x007 = 1 - 2 ** 100; p(x007.positive?)
x008 = 1 - 2 ** 100; c008 = (x008.positive?); p c008
