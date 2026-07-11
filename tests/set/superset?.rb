# frozen_string_literal: true
require 'set'

# Set#superset?
p(Set[1, 2, 3].superset?(Set[1, 2]))
p(Set[1, 2].superset?(Set[1, 2, 3]))
a331 = Set[1, 2, 3]; b331 = Set[1, 2]; p(a331.superset?(b331))

# String elements
p(Set["a", "b", "c"].superset?(Set["a", "b"]))
c331 = Set["a", "b"]; d331 = Set["a", "b"]; p(c331.superset?(d331))

# Symbol elements
e331 = Set[:a, :b]; f331 = Set[:a]; g331 = (e331.superset?(f331)); p(g331)

# a non-Set argument raises ArgumentError
r331 = (Set[1, 2].superset?([1]) rescue $!.class); p r331
h331 = Set[1, 2]; i331 = [1]; r332 = (h331.superset?(i331) rescue $!.class); p r332
