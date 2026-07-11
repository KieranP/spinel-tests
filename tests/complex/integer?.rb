# frozen_string_literal: true
# Complex#integer?
p(Complex(2, 3).integer?)
a001 = Complex(2, 3)
p a001.class
p a001.integer?
a002 = Complex(2, 3)
c002 = a002.integer?
p c002.class
p c002

p(Complex(1.5, 2.5).integer?)
a003 = Complex(1.5, 2.5)
p a003.class
p a003.integer?
a004 = Complex(1.5, 2.5)
c004 = a004.integer?
p c004.class
p c004

p(Complex(-3, -4).integer?)
a005 = Complex(-3, -4)
p a005.class
p a005.integer?
a006 = Complex(-3, -4)
c006 = a006.integer?
p c006.class
p c006
