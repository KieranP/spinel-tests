# frozen_string_literal: true
require 'set'

# Set#<
p(Set[1, 2] < Set[1, 2, 3])
v001 = (Set[1, 2] < Set[1, 2, 3]); p(v001)
p(Set[1, 2, 3] < Set[1, 2])
p(Set[1, 2] < Set[1, 2])

# String elements
p(Set["a", "b"] < Set["a", "b", "c"])
a001s = Set["a", "b"]; b001s = Set["a", "b", "c"]; p(a001s < b001s)

# Symbol elements
c001s = Set[:a]; d001s = Set[:a, :b]; p(c001s < d001s)

# a non-Set argument raises ArgumentError
r001a = (Set[1] < [1, 2] rescue $!.class); p r001a
e001s = Set[1]; f001s = (1..2); r001b = (e001s < f001s rescue $!.class); p r001b
