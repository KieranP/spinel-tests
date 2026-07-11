# frozen_string_literal: true
require 'set'

# Set#+
p((Set[1, 2] + Set[2, 3]).to_a.sort)
a301 = Set[1, 2]; b301 = Set[2, 3]; p((a301 + b301).to_a.sort)
c301 = Set[1, 2]; d301 = [3, 4]; p((c301 + d301).to_a.sort)
e301 = Set[1, 2]; f301 = (e301 + Set[5]); p(f301.to_a.sort)

# Range operand
r301 = ((Set[1, 2] + (2..4)).to_a.sort rescue $!.class); p r301
g301 = Set[1, 2]; r302 = ((g301 + (2..4)).to_a.sort rescue $!.class); p r302

# Symbol elements
i301 = Set[:a, :b]; j301 = Set[:b, :c]; p((i301 + j301).to_a.sort)
