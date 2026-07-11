# frozen_string_literal: true
# Integer#__send__ (BasicObject#__send__)
p(5.__send__(:+, 3))
a001 = 5; p(a001.__send__(:abs))
a002 = 5; b002 = 3; p(a002.__send__(:+, b002))
a003 = 5; c003 = (a003.__send__(:succ)); p c003

p((-5).__send__(:abs))
p(5.__send__(:to_s))
