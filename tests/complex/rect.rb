# frozen_string_literal: true
# Complex#rect

p(Complex(2, 3).rect)

a001 = Complex(2, 3)
p a001.rect

a002 = Complex(2, 3)
c002 = a002.rect
p c002.class
p c002

p(Complex(-4, 5).rect)

a003 = Complex(-4, 5)
p a003.rect

a004 = Complex(-4, 5)
c004 = a004.rect
p c004.class
p c004

p(Complex(2.5, 3.5).rect)

a005 = Complex(2.5, 3.5)
p a005.rect

a006 = Complex(2.5, 3.5)
c006 = a006.rect
p c006.class
p c006

# Complex.rect

p(Complex.rect(2, 3))

d001 = Complex.rect(2, 3)
p d001

e002 = 2
f002 = 3
p e002.class
p f002.class
p Complex.rect(e002, f002)

p(Complex.rect(-4, 5))

d003 = Complex.rect(-4, 5)
p d003
