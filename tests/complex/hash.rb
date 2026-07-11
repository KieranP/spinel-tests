# frozen_string_literal: true
# Complex#hash
p(Complex(2, 3).hash.is_a?(Integer))
a022 = Complex(2, 3); p(a022.hash == a022.hash)
a023 = Complex(2, 3); v023 = (a023.hash.is_a?(Integer)); p v023
