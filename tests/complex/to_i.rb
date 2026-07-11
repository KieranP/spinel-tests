# frozen_string_literal: true
# Complex#to_i

p(Complex(2, 0).to_i)

a101 = Complex(2, 0)
p a101.to_i

c101 = Complex(2, 0).to_i
p c101.class
p c101

p(Complex(-5, 0).to_i)

a102 = Complex(-5, 0)
p a102.to_i

c102 = Complex(-5, 0).to_i
p c102.class
p c102

p(Complex(0, 0).to_i)

a103 = Complex(0, 0)
p a103.to_i

c103 = Complex(0, 0).to_i
p c103.class
p c103

p(Complex(100, 0).to_i)

a104 = Complex(100, 0)
p a104.to_i

c104 = Complex(100, 0).to_i
p c104.class
p c104

# to_i on a Complex with a non-zero imaginary part raises RangeError
begin
  Complex(2, 3).to_i
rescue => e_to_i
  p e_to_i.class
end
