# frozen_string_literal: true
# Complex#angle

p(Complex(1, 1).angle)

a001 = Complex(1, 1)
p a001.angle

a002 = Complex(1, 1)
c002 = a002.angle
p c002.class
p c002

p(Complex(2, -3).angle)

a003 = Complex(2, -3)
p a003.angle

a004 = Complex(2, -3)
c004 = a004.angle
p c004.class
p c004

p(Complex(3.0, 4.0).angle)

a005 = Complex(3.0, 4.0)
p a005.angle

a006 = Complex(3.0, 4.0)
c006 = a006.angle
p c006.class
p c006
