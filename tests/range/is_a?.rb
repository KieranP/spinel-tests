# frozen_string_literal: true
# Range#is_a?
p((1..3).is_a?(Range))
p((1..3).is_a?(Object))
p((1..3).is_a?(String))
a014 = (1..3); p(a014.is_a?(Range))
a015 = (1..3); v015 = a015.is_a?(String); p v015
