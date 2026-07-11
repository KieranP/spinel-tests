# frozen_string_literal: true
# Enumerator#freeze
a039 = [1, 2, 3].each; a039.freeze; p(a039.frozen?)
a040 = [1, 2, 3].each; v040 = a040.freeze; p(v040.frozen?)
