# frozen_string_literal: true
# Integer#negative?
p(5.negative?)
p((-5).negative?)
p(0.negative?)
a001 = -5; p(a001.negative?)
a002 = 5; c002 = (a002.negative?); p c002

a003 = 0; p(a003.negative?)
a004 = -5; c004 = (a004.negative?); p c004

# Bignum receiver:
p((10 ** 30).negative?)
x005 = 10 ** 30; p(x005.negative?)
x006 = 10 ** 30; c006 = (x006.negative?); p c006

# Negative Bignum:
p((1 - 2 ** 100).negative?)
x007 = 1 - 2 ** 100; p(x007.negative?)
x008 = 1 - 2 ** 100; c008 = (x008.negative?); p c008
