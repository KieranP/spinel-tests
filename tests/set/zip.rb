# frozen_string_literal: true
require 'set'

# Set#zip
p(Set[1, 2, 3].zip([4, 5, 6]))
v551 = Set[1, 2, 3].zip([4, 5, 6]); p(v551)
a551 = Set[1, 2]; p(a551.zip([9]))
b551 = Set["a", "b"]; v552 = b551.zip(["x", "y"], ["p", "q"]); p(v552)
