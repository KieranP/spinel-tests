# frozen_string_literal: true
require 'set'

# Set#proper_superset?
p(Set[1, 2, 3].proper_superset?(Set[1, 2]))
v020 = Set[1, 2, 3].proper_superset?(Set[1, 2]); p(v020)
p(Set[1, 2].proper_superset?(Set[1, 2]))

# String elements
p(Set["a", "b"].proper_superset?(Set["a"]))
a020 = Set["a", "b"]; b020 = Set["a", "b"]; p(a020.proper_superset?(b020))

# Symbol elements
c020 = Set[:a, :b]; d020 = Set[:a]; e020 = (c020.proper_superset?(d020)); p(e020)

# a non-Set argument raises ArgumentError
r021b = (Set[1, 2].proper_superset?([1]) rescue $!.class); p r021b
f020 = Set[1, 2]; g020 = [1]; r022b = (f020.proper_superset?(g020) rescue $!.class); p r022b
