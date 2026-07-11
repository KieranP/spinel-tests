# frozen_string_literal: true
# Complex#frozen?
p(Complex(2, 3).frozen?)
a004 = Complex(2, 3); p(a004.frozen?)
a005 = Complex(2, 3); v005 = a005.frozen?; p v005
