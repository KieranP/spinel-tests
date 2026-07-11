# frozen_string_literal: true
# Range#include?
p((1..5).include?(3))
a021 = (1..5); p(a021.include?(3))
a022 = (1..5); b022 = 3; p(a022.include?(b022))
a023 = (1..5); b023 = 3; c023 = (a023.include?(b023)); p c023
p((..5).include?(3))
v005 = ((..5).include?(3)); p(v005)
p((1...5).include?(4))
p((1...5).include?(5))
p((1..5).include?(0))
p(("a".."e").include?("c"))
p(("a".."e").include?("f"))

p((1..).include?(3))
p((1..5).include?(3.0))
p((1.0..5.0).include?(2))
a024 = ("a".."e"); b024 = "c"; c024 = (a024.include?(b024)); p c024
p(("a".."e").include?(3))
p((1..5).include?("x"))
v025 = ((1..5).include?("x")); p v025
b026 = "x"; v026 = ((1..5).include?(b026)); p v026
