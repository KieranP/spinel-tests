# frozen_string_literal: true
# Integer#class
p(5.class)
a001 = 5; p(a001.class)
a002 = 5; v002 = a002.class; p v002

# Bignum receiver (Integer):
p((2 ** 100).class)

# Integer.class
p(Integer.class)
v003 = Integer.class; p v003
