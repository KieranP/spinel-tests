# frozen_string_literal: true
# Complex#arg

p(Complex(1, 1).arg)

a001 = Complex(1, 1)
p a001.arg

a002 = Complex(1, 1)
c002 = a002.arg
p c002.class
p c002

p(Complex(2, -3).arg)

a003 = Complex(2, -3)
p a003.arg

a004 = Complex(2, -3)
c004 = a004.arg
p c004.class
p c004

p(Complex(3.0, 4.0).arg)

a005 = Complex(3.0, 4.0)
p a005.arg

a006 = Complex(3.0, 4.0)
c006 = a006.arg
p c006.class
p c006

p(Complex(0, 0).arg)

z001 = Complex(0, 0)
p z001.arg

p(Complex(-2, 0).arg)

z002 = Complex(-2, 0)
c_z002 = z002.arg
p c_z002.class
p c_z002
