# frozen_string_literal: true
require 'set'

# Set#|
p((Set[1, 2] | Set[2, 3]).to_a.sort)
a010 = Set[1, 2]; b010 = Set[2, 3]; p((a010 | b010).to_a.sort)
c010 = Set[1, 2]; d010 = [4, 5]; p((c010 | d010).to_a.sort)

# String elements
p((Set["a", "b"] | Set["b", "c"]).to_a.sort)
e010 = Set["a", "b"]; f010 = Set["b", "c"]; g010 = (e010 | f010); p(g010.to_a.sort)

# Symbol elements
h010 = Set[:x, :y]; i010 = Set[:y, :z]; p((h010 | i010).to_a.sort)

# union with array of strings
j010 = Set["a"]; k010 = (j010 | ["b", "c"]); p(k010.to_a.sort)

# non-enumerable argument raises ArgumentError
r010 = (Set[1, 2] | 5 rescue $!.class); p r010

# Range operand
r011 = ((Set[1, 2] | (2..4)).to_a.sort rescue $!.class); p r011
l010 = Set[1, 2]; r012 = ((l010 | (2..4)).to_a.sort rescue $!.class); p r012

# Enumerator operand
n010 = (( Set[1, 2] | [3].each ).to_a.sort rescue $!.class); p n010

# Hash operand (each entry is a [key, value] pair)
o010 = Set[[:a, 1]]; p((o010 | { b: 2 }).to_a.sort)
