# frozen_string_literal: true
# Complex#phase
p(Complex(2, 3).phase)
a001 = Complex(2, 3)
p a001.class
p a001.phase
a002 = Complex(2, 3)
c002 = a002.phase
p c002.class
p c002

p(Complex(1.5, 2.5).phase)
a003 = Complex(1.5, 2.5)
p a003.class
p a003.phase
a004 = Complex(1.5, 2.5)
c004 = a004.phase
p c004.class
p c004

p(Complex(-3, -4).phase)
a005 = Complex(-3, -4)
p a005.class
p a005.phase
a006 = Complex(-3, -4)
c006 = a006.phase
p c006.class
p c006
