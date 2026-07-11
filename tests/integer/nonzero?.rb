# frozen_string_literal: true
# Integer#nonzero?
# nonzero? returns self (Integer) when non-zero, nil when zero.
p(5.nonzero?)
p(0.nonzero?)
p((-5).nonzero?)
a001 = 5; p(a001.nonzero?)
a002 = 0; c002 = (a002.nonzero?); p c002

a003 = -5; p(a003.nonzero?)
a004 = 7; c004 = (a004.nonzero?); p c004

# Bignum receiver:
p((10 ** 30).nonzero?)
x005 = 10 ** 30; p(x005.nonzero?)
x006 = 10 ** 30; c006 = (x006.nonzero?); p c006
