# frozen_string_literal: true
# Complex#+

p(Complex(2, 3) + Complex(1, 1))

a001 = Complex(2, 3)
p a001 + Complex(1, 1)

a002 = Complex(2, 3)
b002 = Complex(1, 1)
p a002 + b002

a003 = Complex(2, 3)
b003 = Complex(1, 1)
c003 = a003 + b003
p c003

p(Complex(2, 3) + 1)

a004 = Complex(2, 3)
p a004 + 1

a005 = Complex(2, 3)
b005 = 1
p b005.class
p a005 + b005

a006 = Complex(2, 3)
b006 = 1
c006 = a006 + b006
p c006

p(Complex(2, 3) + 1.5)

a007 = Complex(2, 3)
p a007 + 1.5

a008 = Complex(2, 3)
b008 = 1.5
p b008.class
p a008 + b008

a009 = Complex(2, 3)
b009 = 1.5
c009 = a009 + b009
p c009

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(1, 2) + Rational(1, 2)).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v238 = Complex(1, 2) + Rational(1, 2); p v238.class
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Rational(1, 2) + Complex(1, 2)).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v239 = Rational(1, 2) + Complex(1, 2); p v239.class

zs008 = [Complex(1, 2), Complex(3, -4)]
t008 = zs008.reduce(Complex(0, 0)) { |acc008, z008| acc008 + z008 }
p t008

r240 = (Complex(2, 3) + "x" rescue $!.class); p r240
