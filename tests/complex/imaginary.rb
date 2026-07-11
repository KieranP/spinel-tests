# frozen_string_literal: true
# Complex#imaginary

p(Complex(2, 3).imaginary)

a101 = Complex(2, 3)
p a101.class
p a101.imaginary

a102 = Complex(2, 3)
c102 = a102.imaginary
p c102.class
p c102

p(Complex(2.0, 3.5).imaginary)

a103 = Complex(2.0, 3.5)
p a103.class
p a103.imaginary

a104 = Complex(2.0, 3.5)
c104 = a104.imaginary
p c104.class
p c104

p(Complex(4, -7).imaginary)

a105 = Complex(4, -7)
p a105.class
p a105.imaginary

a106 = Complex(4, -7)
c106 = a106.imaginary
p c106.class
p c106
