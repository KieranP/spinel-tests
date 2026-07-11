# frozen_string_literal: true
# Complex#to_f

p(Complex(2, 0).to_f)

a001 = Complex(2, 0)
p a001.to_f

a002 = Complex(2, 0)
c002 = a002.to_f
p c002.class
p c002

p(Complex(-3, 0).to_f)

a003 = Complex(-3, 0)
p a003.to_f

a004 = Complex(-3, 0)
c004 = a004.to_f
p c004.class
p c004

p(Complex(2.5, 0).to_f)

a005 = Complex(2.5, 0)
p a005.to_f

a006 = Complex(2.5, 0)
c006 = a006.to_f
p c006.class
p c006

# to_f on a Complex with a non-zero imaginary part raises RangeError
begin
  Complex(2, 3).to_f
rescue => e_to_f
  p e_to_f.class
end
