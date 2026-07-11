# frozen_string_literal: true
require 'set'

# Set#entries
p(Set[1, 2, 3].entries)
v681 = Set[1, 2, 3].entries; p(v681)
a681 = Set["a", "b"]; p(a681.entries)
b681 = Set[:x]; v682 = b681.entries; p(v682)
p(Set[].entries)
