# frozen_string_literal: true
# Complex#finite?

p(Complex(2, 3).finite?)

a101 = Complex(2, 3)
p a101.class
p a101.finite?

a102 = Complex(2, 3)
c102 = a102.finite?
p c102.class
p c102

p(Complex(2.0, 3.0).finite?)

a103 = Complex(2.0, 3.0)
p a103.class
p a103.finite?

a104 = Complex(2.0, 3.0)
c104 = a104.finite?
p c104.class
p c104

p(Complex(Float::INFINITY, 0).finite?)

a105 = Complex(Float::INFINITY, 0)
p a105.class
p a105.finite?

a106 = Complex(Float::INFINITY, 0)
c106 = a106.finite?
p c106.class
p c106
