# frozen_string_literal: true
require 'set'

# Set#>=
p(Set[1, 2, 3] >= Set[1, 2])
p(Set[1, 2] >= Set[1, 2, 3])
v303 = (Set[1, 2, 3] >= Set[1, 2]); p(v303)
a303 = Set[1, 2]; b303 = Set[1, 2]; p(a303 >= b303)

# String elements
p(Set["a", "b", "c"] >= Set["a", "b"])
c303 = Set["a", "b"]; d303 = Set["a", "b", "c"]; p(c303 >= d303)

# Symbol elements
e303 = Set[:a, :b]; f303 = Set[:a, :b]; p(e303 >= f303)

# a non-Set argument raises ArgumentError
r305 = (Set[1, 2] >= [1] rescue $!.class); p r305
g303 = Set[1, 2]; h303 = [1]; r306 = (g303 >= h303 rescue $!.class); p r306
