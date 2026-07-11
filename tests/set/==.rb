# frozen_string_literal: true
require 'set'

# Set#== (contents equality)
s122 = Set[1, 2]; t122 = Set[1, 2]; p(s122 == t122)
p(Set[1, 2] == Set[1, 2, 3])
p(Set[2, 1] == Set[1, 2])
u122 = Set[1, 2]; w122 = Set[3]; p(u122 == w122)

# String elements
p(Set["a", "b"] == Set["b", "a"])
x122 = Set["a", "b"]; y122 = Set["a", "b"]; z122 = (x122 == y122); p(z122)

# Symbol elements
p(Set[:a, :b] == Set[:a, :b])

# Set == non-Set
p(Set[1, 2] == [1, 2])

# order does not matter; a non-Set is never equal
p(Set[1, 2] == Set[2, 1])
a094 = Set[1, 2]; b094 = [1, 2]; v094 = (a094 == b094); p v094
p(Set[[1, 2]] == Set[[1, 2]])
c094 = Set[Set[1]]; d094 = Set[Set[1]]; v095 = (c094 == d094); p v095
S094 = Struct.new(:x); e094 = Set[S094.new(1)]; f094 = Set[S094.new(1)]; p(e094 == f094)
