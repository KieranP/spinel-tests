# frozen_string_literal: true
# Range#sort
p((1..5).sort)
a001 = (1..5); v001 = (a001.sort); p v001
p((1..5).sort { |x002, y002| y002 <=> x002 })
p(("a".."e").sort)
p((1..5).to_a.sort)
v003 = ((1..5).to_a.sort); p v003
