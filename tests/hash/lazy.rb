# frozen_string_literal: true
# Hash#lazy
p({ a: 1, b: 2 }.lazy.select { |k, v| v > 0 }.first(1).length)
h001 = { a: 1, b: 2 }; x001 = h001.lazy.select { |k, v| v > 0 }.first(1); p x001.length
p({ a: 1, b: 2 }.lazy.map { |k, v| k }.first(1))
