# frozen_string_literal: true
# TrueClass#hash
p(true.hash.is_a?(Integer))
a022 = true; p(a022.hash == a022.hash)
a023 = true; v023 = (a023.hash.is_a?(Integer)); p v023

# FalseClass#hash
p(false.hash.is_a?(Integer))
a067 = false; p(a067.hash == a067.hash)
a068 = false; v068 = (a068.hash.is_a?(Integer)); p v068

# true and false hash to distinct values, and work as Hash keys
p(true.hash == false.hash)
h024 = { true => 1, false => 2 }
p(h024[true])
p(h024[false])
a025 = true; b025 = false; h025 = { a025 => :t, b025 => :f }; p(h025[true])
