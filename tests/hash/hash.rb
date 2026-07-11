# frozen_string_literal: true
# Hash#hash
p({ a: 1 }.hash.is_a?(Integer))
a022 = { a: 1 }; p(a022.hash == a022.hash)
a023 = { a: 1 }; v023 = (a023.hash.is_a?(Integer)); p v023

# Two Hashes that compare == and eql? report different hash codes.
p({ a: 1 }.hash == { a: 1 }.hash)
a050 = { a: 1 }; b050 = { a: 1 }; c050 = (a050.hash == b050.hash); p c050
p({ "k" => 1 }.hash == { "k" => 1 }.hash)
d050 = ({}.hash == {}.hash); p d050
# Control: #== and #eql? on the same pair, and a Hash against itself, are right.
p(a050 == b050)
p(a050.eql?(b050))
e050 = { a: 1 }; f050 = (e050.hash == e050.hash); p f050
