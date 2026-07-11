# frozen_string_literal: true
# Range#cycle
p((1..3).cycle.first(7))
v072 = (1..3).cycle.first(7); p(v072)
a071 = []; (1..3).cycle(2) { |x| a071 << x }; p a071

v073 = ((1..3).cycle.first(4)); p v073
a074 = (1..3); r074 = []; a074.cycle(2) { |x074| r074 << x074 }; p r074
p((1..3).cycle(0) { |x075| x075 })
r076 = ((1..3).cycle(2).to_a rescue $!.class); p r076
r077 = ((1..3).cycle(0).to_a rescue $!.class); p r077
