# frozen_string_literal: true
# Range#find_index
p((1..5).find_index(3))
a001 = (1..5); b001 = 3; v001 = (a001.find_index(b001)); p v001
p((1..5).find_index { |x002| x002 > 3 })
p((1..5).to_a.find_index(3))
v003 = ((1..5).to_a.find_index(3)); p v003
