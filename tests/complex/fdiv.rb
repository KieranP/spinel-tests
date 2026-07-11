# frozen_string_literal: true
# Complex#fdiv

p(Complex(2, 3).fdiv(2))

a101 = Complex(2, 3)
p a101.class
p a101.fdiv(2)

a102 = Complex(2, 3)
b102 = 2
p b102.class
p a102.fdiv(b102)

a103 = Complex(2, 3)
b103 = 2
c103 = a103.fdiv(b103)
p c103.class
p c103

p(Complex(6, 8).fdiv(4))

a104 = Complex(6, 8)
p a104.class
p a104.fdiv(4)

a105 = Complex(6, 8)
b105 = 4
p b105.class
p a105.fdiv(b105)

a106 = Complex(6, 8)
b106 = 4
c106 = a106.fdiv(b106)
p c106.class
p c106

p(Complex(2.0, 3.0).fdiv(2.0))

a107 = Complex(2.0, 3.0)
p a107.class
p a107.fdiv(2.0)

a108 = Complex(2.0, 3.0)
b108 = 2.0
p b108.class
p a108.fdiv(b108)

a109 = Complex(2.0, 3.0)
b109 = 2.0
c109 = a109.fdiv(b109)
p c109.class
p c109

p(Complex(2, 3).fdiv(2.0))

a110 = Complex(2, 3)
b110 = 2.0
p b110.class
p a110.fdiv(b110)

a111 = Complex(2, 3)
b111 = 2.0
c111 = a111.fdiv(b111)
p c111.class
p c111

p(Complex(2, 3).fdiv(Complex(1, 1)))
a112 = Complex(2, 3)
b112 = Complex(1, 1)
c112 = a112.fdiv(b112)
p c112

r246 = (Complex(2, 3).fdiv("x") rescue $!.class); p r246
