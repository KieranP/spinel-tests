# frozen_string_literal: true
require 'set'

# Set#&
p((Set[1, 2, 3] & Set[2, 3, 4]).to_a.sort)
a001 = Set[1, 2, 3]; b001 = Set[2, 3, 4]; p((a001 & b001).to_a.sort)
c001 = Set[1, 2, 3]; d001 = [2, 3]; p((c001 & d001).to_a.sort)

# String elements
p((Set["a", "b", "c"] & Set["b", "c", "d"]).to_a.sort)
e001 = Set["a", "b", "c"]; f001 = Set["b", "c", "d"]; g001 = (e001 & f001); p(g001.to_a.sort)

# Symbol elements
h001 = Set[:a, :b, :c]; i001 = Set[:b, :c]; p((h001 & i001).to_a.sort)

# disjoint -> empty result
j001 = Set[1, 2]; k001 = (j001 & Set[3, 4]); p(k001.to_a.sort)

# non-enumerable argument raises ArgumentError
r001 = (Set[1, 2] & 5 rescue $!.class); p r001

# Range operand
p((Set[1, 2, 3] & (2..4)).to_a.sort)
l001 = Set[1, 2, 3]; m001 = (l001 & (2..4)); p(m001.to_a.sort)

# Hash operand (each entry is a [key, value] pair)
p((Set[1, 2] & { 1 => :a }).to_a.sort)
p001 = Set[[:a, 1]]; q001 = (p001 & { a: 1 }); p(q001.to_a)

# Float and Struct elements
p((Set[1.5, 2.5] & Set[2.5]).to_a.sort)
n001 = Struct.new(:x); o001 = Set[n001.new(1), n001.new(2)]; p((o001 & Set[n001.new(2)]).size)
