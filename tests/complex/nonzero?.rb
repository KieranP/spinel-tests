# frozen_string_literal: true
# Complex#nonzero?

p(Complex(2, 3).nonzero?)
a001 = Complex(2, 3)
p a001.nonzero?
a002 = Complex(2, 3)
c002 = a002.nonzero?
p c002

p(Complex(0, 0).nonzero?)
a003 = Complex(0, 0)
p a003.nonzero?
a004 = Complex(0, 0)
c004 = a004.nonzero?
p c004
