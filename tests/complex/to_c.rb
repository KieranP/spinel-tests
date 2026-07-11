# frozen_string_literal: true
# Complex#to_c

p(Complex(2, 3).to_c)

a001 = Complex(2, 3)
p a001.to_c

a002 = Complex(2, 3)
c002 = a002.to_c
p c002

p(Complex(-1, 4).to_c)

a003 = Complex(-1, 4)
p a003.to_c

a004 = Complex(-1, 4)
c004 = a004.to_c
p c004

p(Complex(2.5, 3.5).to_c)

a005 = Complex(2.5, 3.5)
p a005.to_c

a006 = Complex(2.5, 3.5)
c006 = a006.to_c
p c006
