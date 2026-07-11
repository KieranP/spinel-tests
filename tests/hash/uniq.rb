# frozen_string_literal: true
# Hash#uniq
p({ a: 1, b: 2 }.uniq)
u1 = { a: 1, b: 2 }; u2 = (u1.uniq); p u2
p({ a: 1, b: 1 }.uniq { |_k, v| v })
