# frozen_string_literal: true
# Proc#freeze
a039 = ->(a) { a }; a039.freeze; p(a039.frozen?)
a040 = ->(a) { a }; v040 = a040.freeze; p(v040.frozen?)
