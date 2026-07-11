# frozen_string_literal: true
# Rational#hash
p(Rational(1, 2).hash.is_a?(Integer))
a022 = Rational(1, 2); p(a022.hash == a022.hash)
a023 = Rational(1, 2); v023 = (a023.hash.is_a?(Integer)); p v023
# equal (reduced-equal) rationals hash equal
p(Rational(1, 2).hash == Rational(2, 4).hash)
a024 = Rational(1, 2); b024 = Rational(2, 4); v024 = (a024.hash == b024.hash); p v024
# usable as a Hash key with reduced-equal lookup
h025 = { Rational(1, 2) => "half" }; p h025[Rational(2, 4)]
a026 = Rational(2, 4); h026 = { Rational(1, 2) => "half" }; v026 = h026[a026]; p v026
