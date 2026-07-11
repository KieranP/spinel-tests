# frozen_string_literal: true
# Kernel — block parameter auto-destructuring of a yielded Array
def pairs124; yield [1, 2]; end
pairs124 { |a124, b124| p(a124 + b124) }
c124 = nil; pairs124 { |a124, b124| c124 = a124 + b124 }; p c124
