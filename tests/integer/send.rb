# frozen_string_literal: true
# Integer#send (Object#send)
p(5.send(:+, 3))
a001 = 5; p(a001.send(:abs))
a002 = 5; b002 = 3; p(a002.send(:+, b002))
a003 = 5; c003 = (a003.send(:succ)); p c003

# unary / predicate / no-arg methods
p((-5).send(:abs))
p(5.send(:to_s))
p(5.send(:even?))
p(5.send(:bit_length))
b004 = (5.send(:to_s)); p b004

# a symbol built in a variable
m005 = :*; p(6.send(m005, 7))
