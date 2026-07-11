# frozen_string_literal: true
# NilClass#hash
p(nil.hash.is_a?(Integer))
a022 = nil; p(a022.hash == a022.hash)
a023 = nil; v023 = (a023.hash.is_a?(Integer)); p v023
