# frozen_string_literal: true
# Symbol#freeze
a039 = :abc; a039.freeze; p(a039.frozen?)
a040 = :abc; v040 = a040.freeze; p(v040.frozen?)
