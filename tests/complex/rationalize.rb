# frozen_string_literal: true
# Complex#rationalize

p(Complex(2, 0).rationalize)

a001 = Complex(2, 0)
p a001.rationalize

a002 = Complex(2, 0)
c002 = a002.rationalize
p c002

p(Complex(-3, 0).rationalize)

a003 = Complex(-3, 0)
p a003.rationalize

a004 = Complex(-3, 0)
c004 = a004.rationalize
p c004

p(Complex(2.5, 0).rationalize)

a005 = Complex(2.5, 0)
p a005.rationalize

a006 = Complex(2.5, 0)
c006 = a006.rationalize
p c006

# rationalize on a Complex with a non-zero imaginary part raises RangeError
begin
  Complex(2, 3).rationalize
rescue => e007
  p e007.class
end

p(Complex(3, 0).rationalize(0.01))
a008 = Complex(3, 0)
c008 = a008.rationalize(0.01)
p c008
p(Complex(3, 0).rationalize(0))
