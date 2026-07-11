# frozen_string_literal: true
# Complex#inspect
p(Complex(2, 3).inspect)
a001 = Complex(2, 3)
p a001.class
p a001.inspect
a002 = Complex(2, 3)
c002 = a002.inspect
p c002.class
p c002

p(Complex(1.5, 2.5).inspect)
a003 = Complex(1.5, 2.5)
p a003.class
p a003.inspect
a004 = Complex(1.5, 2.5)
c004 = a004.inspect
p c004.class
p c004

p(Complex(-3, -4).inspect)
a005 = Complex(-3, -4)
p a005.class
p a005.inspect
a006 = Complex(-3, -4)
c006 = a006.inspect
p c006.class
p c006
