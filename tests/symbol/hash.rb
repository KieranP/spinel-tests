# frozen_string_literal: true
# Symbol#hash
p(:abc.hash.is_a?(Integer))
a022 = :abc; p(a022.hash == a022.hash)
a023 = :abc; v023 = (a023.hash.is_a?(Integer)); p v023
