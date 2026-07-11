# frozen_string_literal: true
require 'set'

# Set#flat_map
p(Set[1, 2].flat_map { |x| [x, x] })
v591 = Set[1, 2].flat_map { |x| [x, x] }; p(v591)
a591 = Set[1, 2]; p(a591.flat_map { |x| x })
b591 = Set["ab", "cd"]; v592 = b591.flat_map { |s| s.chars }; p(v592)
