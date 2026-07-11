# frozen_string_literal: true
# Complex#dup
p(Complex(2, 3).dup == Complex(2, 3))
a037 = Complex(2, 3); b037 = a037.dup; p(b037 == a037)
