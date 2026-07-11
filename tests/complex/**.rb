# frozen_string_literal: true
# Complex#**

p(Complex(2, 3) ** 2)

a001 = Complex(2, 3)
p a001 ** 2

a002 = Complex(2, 3)
b002 = 2
p b002.class
p a002 ** b002

a003 = Complex(2, 3)
b003 = 2
c003 = a003 ** b003
p c003

p(Complex(2, 3) ** Complex(1, 0))

a004 = Complex(2, 3)
p a004 ** Complex(1, 0)

a005 = Complex(2, 3)
b005 = Complex(1, 0)
p a005 ** b005

a006 = Complex(2, 3)
b006 = Complex(1, 0)
c006 = a006 ** b006
p c006

p(Complex(2, 3) ** 1)

a010 = Complex(2, 3)
c010 = a010 ** 1
p c010

p(Complex(2, 3) ** 10)

a011 = Complex(2, 3)
b011 = 10
p b011.class
c011 = a011 ** b011
p c011

p(Complex(2, 3) ** Complex(0, 1))

a012 = Complex(2, 3)
b012 = Complex(0, 1)
c012 = a012 ** b012
p c012

p(Complex(1, -1) ** 3)

a007 = Complex(1, -1)
p a007 ** 3

a008 = Complex(1, -1)
b008 = 3
p b008.class
p a008 ** b008

a009 = Complex(1, -1)
b009 = 3
c009 = a009 ** b009
p c009

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(2, 3) ** 2.0).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v019 = Complex(2, 3) ** 2.0; p v019.class
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(2, 3) ** -1).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v020 = Complex(2, 3) ** -1; p v020.class
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
p((Complex(2, 3) ** -2).class)
# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
v021 = Complex(2, 3) ** -2; p v021.class

p(Complex(2, 3) ** Rational(2, 1))
p((Complex(2, 3) ** Rational(1, 2)).class)

r244 = (Complex(0, 0) ** -1 rescue $!.class); p r244
r245 = (Complex(0, 0) ** -2 rescue $!.class); p r245

# WONTFIX (value only): See docs/limitations.md - "By design — Rational precision and Complex components"
# p(Complex(2, 3) ** -3)
# a Complex base through a block param yields a bare Float, not a Complex
p([Complex(1, 2)].map { |r246| r246**2 })
v246 = [Complex(1, 2)].map { |r247| r247**2 }; p v246
