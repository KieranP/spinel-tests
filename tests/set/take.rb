# frozen_string_literal: true
require 'set'

# Set#take
p(Set[1, 2, 3].take(2))
v491 = Set[1, 2, 3].take(2); p(v491)
a491 = Set[1, 2, 3]; p(a491.take(0))
b491 = Set["a", "b"]; v492 = b491.take(5); p(v492)
