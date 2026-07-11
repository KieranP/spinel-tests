# frozen_string_literal: true
# Float#public_send
p(3.5.public_send(:abs))
a001 = 3.5; p(a001.public_send(:+, 1.0))
a002 = 3.5; b002 = 1.0; c002 = (a002.public_send(:+, b002)); p c002

p(3.5.public_send(:round))
p((-2.5).public_send(:negative?))
a003 = 3.5; c003 = (a003.public_send(:to_i)); p c003
