# frozen_string_literal: true
# Hash#max_by
p({ a: 1, b: 2 }.max_by { |_k, v| v })
a041 = { a: 1, b: 2 }; p(a041.max_by { |_k, v| v })
a042 = { a: 1, b: 2 }; c042 = (a042.max_by { |_k, v| v }); p c042
p({ a: 3, b: 1, c: 2 }.max_by(2) { |_k, v| v })
a217 = { a: 3, b: 1, c: 2 }; c217 = (a217.max_by(2) { |_k, v| v }); p c217
# result is a [k, v] pair; index its key
zh501 = { a: 1, b: 2, c: 3 }; zr501 = zh501.max_by { |_k, v| v }; p zr501.first
# max_by key length over String keys
zh502 = { "apple" => 3, "kiwi" => 1, "fig" => 2 }; zr502 = zh502.max_by { |k, _v| k.length }; p zr502
