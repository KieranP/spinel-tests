# frozen_string_literal: true
# Regexp#freeze
a039 = /ab/; a039.freeze; p(a039.frozen?)
a040 = /ab/; v040 = a040.freeze; p(v040.frozen?)
