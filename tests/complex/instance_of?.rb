# frozen_string_literal: true
# Complex#instance_of?
p(Complex(2, 3).instance_of?(Complex))
p(Complex(2, 3).instance_of?(String))
a018 = Complex(2, 3); p(a018.instance_of?(Complex))
a019 = Complex(2, 3); v019 = a019.instance_of?(String); p v019
