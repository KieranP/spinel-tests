# frozen_string_literal: true
# Proc#hash
p(->(a) { a }.hash.is_a?(Integer))
a022 = ->(a) { a }; p(a022.hash == a022.hash)
a023 = ->(a) { a }; v023 = (a023.hash.is_a?(Integer)); p v023
