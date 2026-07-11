# frozen_string_literal: true
# Complex#kind_of?
p(Complex(2, 3).kind_of?(Complex))
p(Complex(2, 3).kind_of?(Object))
p(Complex(2, 3).kind_of?(String))
a016 = Complex(2, 3); p(a016.kind_of?(Complex))
a017 = Complex(2, 3); v017 = a017.kind_of?(String); p v017
