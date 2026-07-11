# frozen_string_literal: true
# Array#hash
p([1, 2, 3].hash.is_a?(Integer))
a022 = [1, 2, 3]; p(a022.hash == a022.hash)
a023 = [1, 2, 3]; v023 = (a023.hash.is_a?(Integer)); p v023
