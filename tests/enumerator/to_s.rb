# frozen_string_literal: true
# Enumerator#to_s
p([1, 2, 3].each.to_s.is_a?(String))
a035 = [1, 2, 3].each; v035 = a035.to_s; p(v035.is_a?(String))
