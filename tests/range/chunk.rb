# frozen_string_literal: true
# Range#chunk
p((1..8).chunk { |x| x.even? }.to_a)
v001 = (1..8).chunk { |x| x.even? }.to_a; p v001
