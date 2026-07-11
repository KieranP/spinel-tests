# frozen_string_literal: true
# Complex#is_a?
p(Complex(2, 3).is_a?(Complex))
p(Complex(2, 3).is_a?(Object))
p(Complex(2, 3).is_a?(String))
a014 = Complex(2, 3); p(a014.is_a?(Complex))
a015 = Complex(2, 3); v015 = a015.is_a?(String); p v015
