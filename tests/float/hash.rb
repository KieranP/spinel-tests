# frozen_string_literal: true
# Float#hash
p(1.5.hash.is_a?(Integer))
a022 = 1.5; p(a022.hash == a022.hash)
a023 = 1.5; v023 = (a023.hash.is_a?(Integer)); p v023

# eql? values must hash alike
p((-0.0).eql?(0.0))
p((-0.0).hash == (0.0).hash)
v880 = -0.0; w880 = 0.0; c880 = (v880.hash == w880.hash); p c880

# a NaN hashes consistently, and is found again under its own key in CRuby
n881 = Float::NAN; p(n881.hash == n881.hash)
n882 = Float::NAN; h882 = { n882 => 1 }; p h882[n882]
