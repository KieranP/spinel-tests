# frozen_string_literal: true
# Rational#freeze
a039 = Rational(1, 2); a039.freeze; p(a039.frozen?)
a040 = Rational(1, 2); v040 = a040.freeze; p(v040.frozen?)
