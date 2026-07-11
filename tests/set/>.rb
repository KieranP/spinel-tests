# frozen_string_literal: true
require 'set'

# Set#>
p(Set[1, 2, 3] > Set[1, 2])
v002 = (Set[1, 2, 3] > Set[1, 2]); p(v002)
p(Set[1, 2] > Set[1, 2, 3])
p(Set[1, 2] > Set[1, 2])

# String elements
p(Set["a", "b", "c"] > Set["a", "b"])
a002s = Set["a", "b", "c"]; b002s = Set["a", "b"]; p(a002s > b002s)

# Symbol elements
c002s = Set[:a, :b]; d002s = Set[:a]; p(c002s > d002s)

# a non-Set argument raises ArgumentError
r002a = (Set[1, 2] > [1] rescue $!.class); p r002a
e002s = Set[1, 2]; f002s = [1]; r002b = (e002s > f002s rescue $!.class); p r002b
