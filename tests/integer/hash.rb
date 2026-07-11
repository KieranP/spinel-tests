# frozen_string_literal: true
# Integer#hash
p(5.hash.is_a?(Integer))
a022 = 5; p(a022.hash == a022.hash)
a023 = 5; v023 = (a023.hash.is_a?(Integer)); p v023
