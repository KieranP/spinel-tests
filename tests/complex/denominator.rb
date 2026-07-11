# frozen_string_literal: true
# Complex#denominator

p(Complex(2, 3).denominator)

a001 = Complex(2, 3)
p a001.denominator

a002 = Complex(2, 3)
c002 = a002.denominator
p c002.class
p c002

p(Complex(2, -3).denominator)

a003 = Complex(2, -3)
p a003.denominator

a004 = Complex(2, -3)
c004 = a004.denominator
p c004.class
p c004

p(Complex(3.0, 4.0).denominator)

a005 = Complex(3.0, 4.0)
p a005.denominator

a006 = Complex(3.0, 4.0)
c006 = a006.denominator
p c006.class
p c006
