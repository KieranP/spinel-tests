# frozen_string_literal: true
# Integer#pred
p(5.pred)
a070 = 5; p(a070.pred)
a071 = 5; c071 = (a071.pred); p c071

p(0.pred)
p(1.pred)
p((-5).pred)
a072 = 0; p(a072.pred)
a073 = 1; c073 = (a073.pred); p c073

# Boundary (2**64).pred:
p((2 ** 64).pred)
x074 = 2 ** 64; p(x074.pred)
x075 = 2 ** 64; c075 = (x075.pred); p c075

# Bignum receiver (big - 1):
p((2 ** 100).pred)
x076 = 2 ** 100; p(x076.pred)
x077 = 2 ** 100; c077 = (x077.pred); p c077
