# frozen_string_literal: true
# Float#quo
p(10.0.quo(3))
a001 = 10.0; p(a001.quo(3))
a002 = 10.0; b002 = 3; c002 = (a002.quo(b002)); p c002

# Float#quo with a Float / Rational divisor
p(10.0.quo(2.5))
p(1.0.quo(Rational(1, 2)))
a003 = 7.0; b003 = 2.0; c003 = a003.quo(b003); p c003

# division by zero yields signed Infinity
p(1.0.quo(0.0))
p(-1.0.quo(0.0))
