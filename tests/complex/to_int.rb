# frozen_string_literal: true
# Complex#to_int

p(Complex(3, 0).to_int)

a001 = Complex(3, 0)
p a001.to_int

a002 = Complex(3, 0)
c002 = a002.to_int
p c002.class
p c002

p(Complex(-5, 0).to_int)

a003 = Complex(-5, 0)
p a003.to_int

a004 = Complex(-5, 0)
c004 = a004.to_int
p c004.class
p c004

p(Complex(0, 0).to_int)

a005 = Complex(0, 0)
p a005.to_int

a006 = Complex(0, 0)
c006 = a006.to_int
p c006.class
p c006

# to_int on a Complex with a non-zero imaginary part raises RangeError
begin
  Complex(2, 3).to_int
rescue => e007
  p e007.class
end
