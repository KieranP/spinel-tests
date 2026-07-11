# frozen_string_literal: true
# Complex#real

p(Complex(2, 3).real)

a001 = Complex(2, 3)
p a001.real

a002 = Complex(2, 3)
c002 = a002.real
p c002.class
p c002

p(Complex(-4, 5).real)

a003 = Complex(-4, 5)
p a003.real

a004 = Complex(-4, 5)
c004 = a004.real
p c004.class
p c004

p(Complex(2.5, 3).real)

a005 = Complex(2.5, 3)
p a005.real

a006 = Complex(2.5, 3)
c006 = a006.real
p c006.class
p c006

v062 = ([Complex(1, 2), Complex(3, 4)].map { |z062| z062.real } rescue $!.class); p v062
