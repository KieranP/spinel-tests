# frozen_string_literal: true
# Complex#*
p(Complex(2, 3) * Complex(1, 1))

a001 = Complex(2, 3)
p a001.class
p(a001 * Complex(1, 1))

a002 = Complex(2, 3)
b002 = Complex(1, 1)
p b002.class
p(a002 * b002)

a003 = Complex(2, 3)
b003 = Complex(1, 1)
c003 = a003 * b003
p c003.class
p c003

p(Complex(2, 3) * 2)

a004 = Complex(2, 3)
p a004.class
p(a004 * 2)

a005 = Complex(2, 3)
b005 = 2
p b005.class
p(a005 * b005)

a006 = Complex(2, 3)
b006 = 2
c006 = a006 * b006
p c006.class
p c006

p(Complex(2, 3) * 2.0)

a007 = Complex(2, 3)
p a007.class
p(a007 * 2.0)

a008 = Complex(2, 3)
b008 = 2.0
p b008.class
p(a008 * b008)

a009 = Complex(2, 3)
b009 = 2.0
c009 = a009 * b009
p c009.class
p c009

p(2 * Complex(1, 1))

a010 = 2
p a010.class
p(a010 * Complex(1, 1))

a011 = 2
b011 = Complex(1, 1)
c011 = a011 * b011
p c011.class
p c011

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(1, 2) * Rational(1, 2)).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v241 = Complex(1, 2) * Rational(1, 2); p v241.class

r242 = (Complex(2, 3) * true rescue $!.class); p r242
