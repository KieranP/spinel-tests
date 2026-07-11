# frozen_string_literal: true
# Integer#bit_length
p(255.bit_length)
a024 = 255; p(a024.bit_length)
a025 = 255; c025 = (a025.bit_length); p c025

p(0.bit_length)
p(1.bit_length)
p((-1).bit_length)
p((-256).bit_length)
p(1023.bit_length)
p(1024.bit_length)
bl01 = -256; p(bl01.bit_length)
bl02 = -256; cbl02 = (bl02.bit_length); p cbl02

# Bignum
bl03 = 2 ** 100; p(bl03.bit_length)
bl04 = 2 ** 100; cbl04 = (bl04.bit_length); p cbl04
# Negative Bignum via subtraction (avoids the unary-minus-on-Bignum abort)
p((1 - 2 ** 100).bit_length)
bl05 = 1 - 2 ** 100; cbl05 = (bl05.bit_length); p cbl05
