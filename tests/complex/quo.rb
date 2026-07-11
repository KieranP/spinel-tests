# frozen_string_literal: true
# Complex#quo
p(Complex(2, 3).quo(2.0))
a001 = Complex(2, 3)
p a001.class
p a001.quo(2.0)
a002 = Complex(2, 3)
b002 = 2.0
p b002.class
p a002.quo(b002)
a003 = Complex(2, 3)
b003 = 2.0
c003 = a003.quo(b003)
p c003.class
p c003

p(Complex(6.0, 8.0).quo(2.0))
a004 = Complex(6.0, 8.0)
p a004.class
p a004.quo(2.0)
a005 = Complex(6.0, 8.0)
b005 = 2.0
p b005.class
p a005.quo(b005)
a006 = Complex(6.0, 8.0)
b006 = 2.0
c006 = a006.quo(b006)
p c006.class
p c006

p(Complex(-4, -8).quo(2.0))
a007 = Complex(-4, -8)
p a007.class
p a007.quo(2.0)
a008 = Complex(-4, -8)
b008 = 2.0
p b008.class
p a008.quo(b008)
a009 = Complex(-4, -8)
b009 = 2.0
c009 = a009.quo(b009)
p c009.class
p c009

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(2, 3).quo(2)).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v079 = Complex(2, 3).quo(2); p v079.class

r247 = (Complex(2, 3).quo("x") rescue $!.class); p r247
