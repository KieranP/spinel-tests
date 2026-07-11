# frozen_string_literal: true
# Complex#to_r

p(Complex(2, 0).to_r)

a111 = Complex(2, 0)
p a111.to_r

c111 = Complex(2, 0).to_r
p c111

p(Complex(-5, 0).to_r)

a112 = Complex(-5, 0)
p a112.to_r

c112 = Complex(-5, 0).to_r
p c112

p(Complex(0, 0).to_r)

a113 = Complex(0, 0)
p a113.to_r

c113 = Complex(0, 0).to_r
p c113

# to_r on a Complex with a non-zero imaginary part raises RangeError
begin
  Complex(2, 3).to_r
rescue => e_to_r
  p e_to_r.class
end
