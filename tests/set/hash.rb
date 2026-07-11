# frozen_string_literal: true
require 'set'

# Set#hash
p(Set[1, 2, 3].hash.is_a?(Integer))
a022 = Set[1, 2, 3]; p(a022.hash == a022.hash)
a023 = Set[1, 2, 3]; v023 = (a023.hash.is_a?(Integer)); p v023

# equal sets hash equal (Set#hash must be content-based)
p(Set[1, 2, 3].hash == Set[1, 2, 3].hash)
p(Set[1, 2, 3].hash == Set[3, 2, 1].hash)
b023 = Set["a", "b"]; c023 = Set["b", "a"]; p(b023.hash == c023.hash)

# a Set used as an outer Hash key needs key-side #hash/#eql? dispatch
# d023 = { Set[1, 2] => "x" }; p(d023[Set[2, 1]])  # WONTFIX: See docs/limitations.md - "Fundamental limits — User-defined #hash / #eql? for hash keys"

# equal Sets hash equal regardless of insertion order
p(Set[1, 2].hash == Set[2, 1].hash)
a093 = Set["a", "b"]; b093 = Set["b", "a"]; v093 = (a093.hash == b093.hash); p v093
c093 = Set[Set[1]]; d093 = Set[Set[1]]; p(c093.hash == d093.hash)
e093 = Set[1]; f093 = Set[2]; v094b = (e093.hash == f093.hash); p v094b
