# frozen_string_literal: true
# Complex#rectangular

p(Complex(2, 3).rectangular)

a001 = Complex(2, 3)
p a001.rectangular

a002 = Complex(2, 3)
c002 = a002.rectangular
p c002.class
p c002

p(Complex(-4, 5).rectangular)

a003 = Complex(-4, 5)
p a003.rectangular

a004 = Complex(-4, 5)
c004 = a004.rectangular
p c004.class
p c004

p(Complex(2.5, 3.5).rectangular)

a005 = Complex(2.5, 3.5)
p a005.rectangular

a006 = Complex(2.5, 3.5)
c006 = a006.rectangular
p c006.class
p c006

# Complex.rectangular

p(Complex.rectangular(2, 3))

d001 = Complex.rectangular(2, 3)
p d001

e002 = 2
f002 = 3
p e002.class
p f002.class
p Complex.rectangular(e002, f002)

p(Complex.rectangular(-4, 5))

d003 = Complex.rectangular(-4, 5)
p d003
