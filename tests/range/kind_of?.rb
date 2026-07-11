# frozen_string_literal: true
# Range#kind_of?
p((1..3).kind_of?(Range))
p((1..3).kind_of?(Object))
p((1..3).kind_of?(String))
a016 = (1..3); p(a016.kind_of?(Range))
a017 = (1..3); v017 = a017.kind_of?(String); p v017
