# frozen_string_literal: true
# Enumerator#is_a?
p([1, 2, 3].each.is_a?(Enumerator))
p([1, 2, 3].each.is_a?(Object))
p([1, 2, 3].each.is_a?(String))
a014 = [1, 2, 3].each; p(a014.is_a?(Enumerator))
a015 = [1, 2, 3].each; v015 = a015.is_a?(String); p v015
