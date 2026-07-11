# frozen_string_literal: true
require 'set'

# Set#proper_subset?
p(Set[1, 2].proper_subset?(Set[1, 2, 3]))
v019 = Set[1, 2].proper_subset?(Set[1, 2, 3]); p(v019)
p(Set[1, 2].proper_subset?(Set[1, 2]))

# String elements
p(Set["a"].proper_subset?(Set["a", "b"]))
a019 = Set["a", "b"]; b019 = Set["a", "b"]; p(a019.proper_subset?(b019))

# Symbol elements
c019 = Set[:a]; d019 = Set[:a, :b]; e019 = (c019.proper_subset?(d019)); p(e019)

# a non-Set argument raises ArgumentError
r019 = (Set[1].proper_subset?([1, 2]) rescue $!.class); p r019
f019 = Set[1]; g019 = [1, 2]; r020 = (f019.proper_subset?(g019) rescue $!.class); p r020
