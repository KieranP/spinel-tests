# frozen_string_literal: true
# Integer#public_send (Object#public_send)
p(5.public_send(:+, 3))
a001 = 5; p(a001.public_send(:abs))
a002 = 5; b002 = 3; p(a002.public_send(:+, b002))
a003 = 5; c003 = (a003.public_send(:bit_length)); p c003

p((-5).public_send(:abs))
p(5.public_send(:to_s))
