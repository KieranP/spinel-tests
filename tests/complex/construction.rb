# frozen_string_literal: true
# Complex() / literals / #to_c — construction

p(Complex(2, 3))

v001 = Complex(2, 3)
p v001.class
p v001

a001 = 2
b001 = 3
c001 = Complex(a001, b001)
p c001.class
p c001

p(Complex(1))

v002 = Complex(1)
p v002.class
p v002

p(Complex(2, -3))

v005 = Complex(2, -3)
p v005.class
p v005

p(Complex(3.0, 4.0))

v011 = Complex(3.0, 4.0)
p v011.class
p v011

p(2 + 3i)

v003 = 2 + 3i
p v003.class
p v003

p(1i)

v004 = 1i
p v004.class
p v004

p(Complex("2+3i"))

v006 = Complex("2+3i")
p v006.class
p v006

p("1+2i".to_c)

v007 = "1+2i".to_c
p v007.class
p v007

a002 = "1+2i"
p a002.class
v008 = a002.to_c
p v008

p(2.to_c)

v009 = 2.to_c
p v009.class
p v009

a003 = 2
p a003.class
v010 = a003.to_c
p v010

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(Rational(1,2), Rational(1,3))).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v243 = Complex(Rational(1,2), Rational(1,3)); p v243.class

p(Complex("-2-3i"))

v020 = Complex("-2-3i")
p v020.class
p v020

p(Complex("2i"))

v021 = Complex("2i")
p v021.class
p v021

p(Complex(2.5))

v022 = Complex(2.5)
p v022.class
p v022

p(Complex(2, 3.0))

v023 = Complex(2, 3.0)
p v023.class
p v023
