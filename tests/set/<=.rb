# frozen_string_literal: true
require 'set'

# Set#<=
p(Set[1, 2] <= Set[1, 2, 3])
p(Set[1, 2, 3] <= Set[1, 2])
v302 = (Set[1, 2] <= Set[1, 2, 3]); p(v302)
a302 = Set[1, 2, 3]; b302 = Set[1, 2, 3]; p(a302 <= b302)

# String elements
p(Set["a", "b"] <= Set["a", "b", "c"])
c302 = Set["a", "b", "c"]; d302 = Set["a", "b"]; p(c302 <= d302)

# Symbol elements
e302 = Set[:a, :b]; f302 = Set[:a, :b]; p(e302 <= f302)

# a non-Set argument raises ArgumentError
r302 = (Set[1] <= [1, 2] rescue $!.class); p r302
g302 = Set[1]; h302 = [1, 2]; r303 = (g302 <= h302 rescue $!.class); p r303
r304 = (Set[1] <= 5 rescue $!.class); p r304
