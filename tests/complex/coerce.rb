# frozen_string_literal: true
# Complex#coerce

p(Complex(2, 3).coerce(2))

a001 = Complex(2, 3)
p a001.coerce(2)

a002 = Complex(2, 3)
b002 = 2
p b002.class
p a002.coerce(b002)

a003 = Complex(2, 3)
b003 = 2
c003 = a003.coerce(b003)
p c003.class
p c003

p(Complex(2, 3).coerce(2.5))

a004 = Complex(2, 3)
p a004.coerce(2.5)

a005 = Complex(2, 3)
b005 = 2.5
p b005.class
p a005.coerce(b005)

a006 = Complex(2, 3)
b006 = 2.5
c006 = a006.coerce(b006)
p c006.class
p c006

p(Complex(2, 3).coerce(Complex(1, 1)))
a007 = Complex(2, 3)
b007 = Complex(1, 1)
c007 = a007.coerce(b007)
p c007

r244 = (Complex(2, 3).coerce("x") rescue $!.class); p r244
r245 = (Complex(2, 3).coerce(nil) rescue $!.class); p r245
