# frozen_string_literal: true
# Range#grep
p((1..5).grep(2..4))
a001 = (1..5); b001 = (2..4); v001 = (a001.grep(b001)); p v001
p((1..5).grep(Integer))
p((1..5).grep(2..4) { |x002| x002 * 10 })
p((1..5).to_a.grep(2..4))
v003 = ((1..5).to_a.grep(2..4)); p v003
