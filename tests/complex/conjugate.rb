# frozen_string_literal: true
# Complex#conjugate

p(Complex(2, 3).conjugate)

a001 = Complex(2, 3)
p a001.conjugate

a002 = Complex(2, 3)
c002 = a002.conjugate
p c002

p(Complex(2, -3).conjugate)

a003 = Complex(2, -3)
p a003.conjugate

a004 = Complex(2, -3)
c004 = a004.conjugate
p c004

p(Complex(3.0, 4.0).conjugate)

a005 = Complex(3.0, 4.0)
p a005.conjugate

a006 = Complex(3.0, 4.0)
c006 = a006.conjugate
p c006

xs997 = [Complex(1, 2), Complex(3, 4)]
p xs997[1].conjugate.real.round(3)
