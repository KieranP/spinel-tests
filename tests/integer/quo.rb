# frozen_string_literal: true
# Integer#quo
p(7.quo(2))
p(6.quo(3))
p(7.quo(2).class)
a001 = 7; p(a001.quo(2))
a002 = 7; b002 = 2; p(a002.quo(b002))
a003 = 7; b003 = 2; c003 = (a003.quo(b003)); p c003
p(7.quo(2.0))

# Integer#quo negative operands (Rational)
p((-7).quo(2))
p(7.quo(-2))
p((-7).quo(-2))
a010 = -7; b010 = 2; c010 = (a010.quo(b010)); p c010

# Integer#quo zero dividend and exact division
p(0.quo(5))
a011 = 0; b011 = 5; c011 = (a011.quo(b011)); p c011

# Integer#quo with a Float argument (result is Float, not Rational)
p(7.quo(2.0).class)
a012 = 7; b012 = 2.0; c012 = (a012.quo(b012)); p c012
p(a012.quo(b012).class)

# Integer#quo with a Bignum receiver
p((2 ** 70).quo(3))
a013 = 2 ** 70; b013 = 3; c013 = (a013.quo(b013)); p c013

# Integer#quo by zero (ZeroDivisionError)
r014 = (7.quo(0) rescue $!.class); p r014
a015 = 7; b015 = 0; r015 = (a015.quo(b015) rescue $!.class); p r015
