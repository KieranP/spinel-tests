# frozen_string_literal: true
# Complex#==

p(Complex(2, 3) == Complex(2, 3))

a001 = Complex(2, 3)
p(a001 == Complex(2, 3))

a002 = Complex(2, 3)
b002 = Complex(2, 3)
p(a002 == b002)

a003 = Complex(2, 3)
b003 = Complex(2, 3)
c003 = (a003 == b003)
p c003.class
p c003

p(Complex(2, 3) == Complex(1, 1))

a004 = Complex(2, 3)
p(a004 == Complex(1, 1))

a005 = Complex(2, 3)
b005 = Complex(1, 1)
p(a005 == b005)

a006 = Complex(2, 3)
b006 = Complex(1, 1)
c006 = (a006 == b006)
p c006.class
p c006

p(Complex(2, 3) == 2)

a007 = Complex(2, 3)
p(a007 == 2)

a008 = Complex(2, 3)
b008 = 2
p b008.class
p(a008 == b008)

a009 = Complex(2, 3)
b009 = 2
c009 = (a009 == b009)
p c009.class
p c009

p(Complex(2, 0) == 2)

a010 = Complex(2, 0)
p(a010 == 2)

a011 = Complex(2, 0)
b011 = 2
p b011.class
p(a011 == b011)

a012 = Complex(2, 0)
b012 = 2
c012 = (a012 == b012)
p c012.class
p c012

p(Complex(2, 3) == nil)

a013 = Complex(2, 3)
c013 = (a013 == nil)
p c013

p(Complex(2, 3) == 2.0)

a014 = Complex(2, 3)
c014 = (a014 == 2.0)
p c014

p(Complex(2, 3) == "foo")
p(Complex(2, 3) == :sym)
p(Complex(2, 3) == [1, 2])
a015 = Complex(2, 3)
c015 = (a015 == "foo")
p c015
p(Complex(2, 3) != "foo")
