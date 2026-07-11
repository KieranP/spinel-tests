# frozen_string_literal: true
# Range#uniq
p((1..5).uniq)
a001 = (1..5); v001 = (a001.uniq); p v001
p((1..5).uniq { |x002| x002 % 2 })
p((1..5).to_a.uniq)
v003 = ((1..5).to_a.uniq); p v003
