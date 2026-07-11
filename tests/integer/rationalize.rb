# frozen_string_literal: true
# Integer#rationalize
p(5.rationalize)
p((-5).rationalize)
p(0.rationalize)
p(5.rationalize.class)
a001 = 5; p(a001.rationalize)
a002 = -5; c002 = (a002.rationalize); p c002

# With a precision argument (ignored for an Integer receiver):
p(5.rationalize(0.1))
a003 = 5; b003 = 0.1; c003 = (a003.rationalize(b003)); p c003

# Bignum receiver:
p((2 ** 100).rationalize)
x004 = (2 ** 100).rationalize; p x004
