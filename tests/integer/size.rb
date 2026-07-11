# frozen_string_literal: true
# Integer#size
p(1.size)
a335 = 1; p(a335.size)
a336 = 1; c336 = (a336.size); p c336

p(0.size)
p(255.size)
p((-1).size)
sz01 = -256; p(sz01.size)
sz02 = -256; csz02 = (sz01.size); p csz02
# Bignum size (byte count of the internal representation)
sz03 = 2 ** 100; p(sz03.size)
sz04 = 2 ** 100; csz04 = (sz04.size); p csz04
