# frozen_string_literal: true
# Complex#<=>

p(Complex(2, 0) <=> Complex(3, 0))

a001 = Complex(2, 0)
p(a001 <=> Complex(3, 0))

a002 = Complex(2, 0)
b002 = Complex(3, 0)
p(a002 <=> b002)

a003 = Complex(2, 0)
b003 = Complex(3, 0)
c003 = (a003 <=> b003)
p c003.class
p c003

p(Complex(2, 0) <=> 3)

a004 = Complex(2, 0)
p(a004 <=> 3)

a005 = Complex(2, 0)
b005 = 3
p b005.class
p(a005 <=> b005)

a006 = Complex(2, 0)
b006 = 3
c006 = (a006 <=> b006)
p c006.class
p c006

p(Complex(2, 3) <=> Complex(1, 1))

a007 = Complex(2, 3)
p(a007 <=> Complex(1, 1))

a008 = Complex(2, 3)
b008 = Complex(1, 1)
p(a008 <=> b008)

a009 = Complex(2, 3)
b009 = Complex(1, 1)
c009 = (a009 <=> b009)
p c009.class
p c009

p(Complex(2, 0) <=> 2.5)

a010 = Complex(2, 0)
b010 = 2.5
p b010.class
c010 = (a010 <=> b010)
p c010

p((Complex(2, 0) <=> nil).inspect)

a011 = Complex(2, 0)
c011 = (a011 <=> nil)
p c011.inspect

p((Complex(2, 3) <=> Complex(2, 3)).inspect)

a012 = Complex(2, 3)
b012 = Complex(2, 3)
c012 = (a012 <=> b012)
p c012.inspect
