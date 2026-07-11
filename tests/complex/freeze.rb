# frozen_string_literal: true
# Complex#freeze
a039 = Complex(2, 3); a039.freeze; p(a039.frozen?)
a040 = Complex(2, 3); v040 = a040.freeze; p(v040.frozen?)
