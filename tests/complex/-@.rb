# frozen_string_literal: true
# Complex#-@
p(-Complex(2, 3))

a001 = Complex(2, 3)
p a001.class
p(-a001)

a002 = Complex(2, 3)
c002 = -a002
p c002.class
p c002

p(-Complex(-1, 4))

a003 = Complex(-1, 4)
p a003.class
p(-a003)

a004 = Complex(-1, 4)
c004 = -a004
p c004.class
p c004

p(-Complex(0, -5))

a005 = Complex(0, -5)
p a005.class
p(-a005)

a006 = Complex(0, -5)
c006 = -a006
p c006.class
p c006

p(-Complex(2.5, -3.5))

a007 = Complex(2.5, -3.5)
p a007.class
p(-a007)

a008 = Complex(2.5, -3.5)
c008 = -a008
p c008.class
p c008
