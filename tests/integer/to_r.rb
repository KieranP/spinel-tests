# frozen_string_literal: true
# Integer#to_r
p(42.to_r)
a087 = 42; p(a087.to_r)
a088 = 42; c088 = (a088.to_r); p c088

p(0.to_r)
p((-42).to_r)
p(42.to_r.class)
a089 = -42; p(a089.to_r)
a090 = -42; c090 = (a090.to_r); p c090
a091 = 7; c091 = (a091.to_r.class); p c091

# Bignum receiver (returns (big/1)):
p((10 ** 30).to_r)
x092 = 10 ** 30; p(x092.to_r)
x093 = 10 ** 30; c093 = (x093.to_r); p c093
