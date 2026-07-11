# frozen_string_literal: true
# Complex#eql?

p(Complex(2, 3).eql?(Complex(2, 3)))

a101 = Complex(2, 3)
p a101.class
p a101.eql?(Complex(2, 3))

a102 = Complex(2, 3)
b102 = Complex(2, 3)
p b102.class
p a102.eql?(b102)

a103 = Complex(2, 3)
b103 = Complex(2, 3)
c103 = a103.eql?(b103)
p c103.class
p c103

p(Complex(2, 3).eql?(Complex(2, 4)))

a104 = Complex(2, 3)
p a104.class
p a104.eql?(Complex(2, 4))

a105 = Complex(2, 3)
b105 = Complex(2, 4)
p b105.class
p a105.eql?(b105)

a106 = Complex(2, 3)
b106 = Complex(2, 4)
c106 = a106.eql?(b106)
p c106.class
p c106

p(Complex(2.0, 3.0).eql?(Complex(2.0, 3.0)))

a107 = Complex(2.0, 3.0)
p a107.class
p a107.eql?(Complex(2.0, 3.0))

a108 = Complex(2.0, 3.0)
b108 = Complex(2.0, 3.0)
p b108.class
p a108.eql?(b108)

a109 = Complex(2.0, 3.0)
b109 = Complex(2.0, 3.0)
c109 = a109.eql?(b109)
p c109.class
p c109

p(Complex(2, 3).eql?(Complex(2.0, 3.0)))

a110 = Complex(2, 3)
p a110.class
p a110.eql?(Complex(2.0, 3.0))

a111 = Complex(2, 3)
b111 = Complex(2.0, 3.0)
p b111.class
p a111.eql?(b111)

a112 = Complex(2, 3)
b112 = Complex(2.0, 3.0)
c112 = a112.eql?(b112)
p c112.class
p c112
