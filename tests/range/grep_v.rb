# frozen_string_literal: true
# Range#grep_v
p((1..5).grep_v(2..4))
a001 = (1..5); b001 = (2..4); v001 = (a001.grep_v(b001)); p v001
p((1..5).to_a.grep_v(2..4))
v002 = ((1..5).to_a.grep_v(2..4)); p v002
