# frozen_string_literal: true
# Complex#real?

p(Complex(2, 3).real?)

a001 = Complex(2, 3)
p a001.real?

a002 = Complex(2, 3)
c002 = a002.real?
p c002.class
p c002

p(Complex(0, 5).real?)

a003 = Complex(0, 5)
p a003.real?

a004 = Complex(0, 5)
c004 = a004.real?
p c004.class
p c004

p(Complex(-1, -2).real?)

a005 = Complex(-1, -2)
p a005.real?

a006 = Complex(-1, -2)
c006 = a006.real?
p c006.class
p c006
