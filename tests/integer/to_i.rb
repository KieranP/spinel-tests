# frozen_string_literal: true
# Integer#to_i
p(42.to_i)
a331 = 42; p(a331.to_i)
a332 = 42; c332 = (a332.to_i); p c332

p(0.to_i)
p((-42).to_i)

# Bignum receiver: to_i truncates to 64 bits instead of returning self.
p((10 ** 30).to_i)
a333 = 10 ** 30; c333 = (a333.to_i); p c333
