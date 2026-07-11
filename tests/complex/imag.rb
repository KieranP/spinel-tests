# frozen_string_literal: true
# Complex#imag

p(Complex(2, 3).imag)

a101 = Complex(2, 3)
p a101.class
p a101.imag

a102 = Complex(2, 3)
c102 = a102.imag
p c102.class
p c102

p(Complex(2.0, 3.5).imag)

a103 = Complex(2.0, 3.5)
p a103.class
p a103.imag

a104 = Complex(2.0, 3.5)
c104 = a104.imag
p c104.class
p c104

p(Complex(4, -7).imag)

a105 = Complex(4, -7)
p a105.class
p a105.imag

a106 = Complex(4, -7)
c106 = a106.imag
p c106.class
p c106
