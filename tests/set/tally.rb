# frozen_string_literal: true
require 'set'

# Set#tally
p(Set[1, 2, 3].tally)
v531 = Set[1, 2, 3].tally; p(v531)
a531 = Set["a", "b"]; p(a531.tally)
b531 = Set[:x, :y]; v532 = b531.tally; p(v532)
p(Set[].tally)
