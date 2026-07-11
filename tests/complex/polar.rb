# frozen_string_literal: true
# Complex#polar
p(Complex(2, 3).polar)
a001 = Complex(2, 3)
p a001.class
p a001.polar
a002 = Complex(2, 3)
c002 = a002.polar
p c002.class
p c002

p(Complex(1.5, 2.5).polar)
a003 = Complex(1.5, 2.5)
p a003.class
p a003.polar
a004 = Complex(1.5, 2.5)
c004 = a004.polar
p c004.class
p c004

p(Complex(-3, -4).polar)
a005 = Complex(-3, -4)
p a005.class
p a005.polar
a006 = Complex(-3, -4)
c006 = a006.polar
p c006.class
p c006

# Complex.polar
p(Complex.polar(1, 0))
r001 = 1
t001 = 0
p r001.class
p t001.class
p Complex.polar(r001, t001)
r002 = 1
t002 = 0
d002 = Complex.polar(r002, t002)
p d002.class
p d002

p(Complex.polar(2.0, 1.0))
r003 = 2.0
t003 = 1.0
p r003.class
p t003.class
p Complex.polar(r003, t003)
r004 = 2.0
t004 = 1.0
d004 = Complex.polar(r004, t004)
p d004.class
p d004
