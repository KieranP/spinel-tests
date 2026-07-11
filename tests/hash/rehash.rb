# frozen_string_literal: true
# Hash#rehash
h = { a: 1, b: 2 }; h.rehash; p h
rh1 = { a: 1 }; rh2 = (rh1.rehash); p rh2
