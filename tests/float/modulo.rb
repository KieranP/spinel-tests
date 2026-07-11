# frozen_string_literal: true
# Float#modulo
p(5.5.modulo(2.0))
a001 = 5.5; b001 = 2.0; p(a001.modulo(b001))
a002 = 5.5; b002 = 2.0; c002 = (a002.modulo(b002)); p c002

# Float#modulo with an Integer, and sign following the divisor
p(5.5.modulo(2))
p(-5.5.modulo(2.0))
p(5.5.modulo(-2.0))

# infinite divisor, and modulo by zero
p(5.5.modulo(Float::INFINITY))
r001 = (1.5.modulo(0.0) rescue $!.class); p r001
a003 = 5.5; b003 = Float::INFINITY; c003 = a003.modulo(b003); p c003
