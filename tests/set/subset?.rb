# frozen_string_literal: true
require 'set'

# Set#subset?
p(Set[1, 2, 3].subset?(Set[1, 2, 3, 4]))
a008 = Set[1, 2]; b008 = Set[1, 2, 3]; p(a008.subset?(b008))
p(Set[1, 2, 3].subset?(Set[1, 2]))

# String elements
p(Set["a", "b"].subset?(Set["a", "b", "c"]))
c008 = Set["a", "b"]; d008 = Set["a", "b"]; p(c008.subset?(d008))

# Symbol elements
e008 = Set[:a]; f008 = Set[:a, :b]; g008 = (e008.subset?(f008)); p(g008)

# a non-Set argument raises ArgumentError
r008 = (Set[1].subset?([1, 2]) rescue $!.class); p r008
h008 = Set[1]; i008 = [1, 2]; r009 = (h008.subset?(i008) rescue $!.class); p r009
