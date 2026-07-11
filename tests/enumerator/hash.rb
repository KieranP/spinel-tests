# frozen_string_literal: true
# Enumerator#hash
p([1, 2, 3].each.hash.is_a?(Integer))
a022 = [1, 2, 3].each; p(a022.hash == a022.hash)
a023 = [1, 2, 3].each; v023 = (a023.hash.is_a?(Integer)); p v023
