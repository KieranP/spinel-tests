# frozen_string_literal: true
# Range#chunk_while
# chunk_while{}.to_a is the one fused form that works under both:
p((1..6).chunk_while { |i, j| j == i + 1 }.to_a)
v001 = (1..6).chunk_while { |i, j| j == i + 1 }.to_a; p v001
r002 = ((1..8).chunk_while { |i, j| j == i + 1 }.map { |r| r.sum } rescue $!.class); p r002
