# frozen_string_literal: true
require 'set'

# Set#to_h
p(Set[[1, 2], [3, 4]].to_h)
v541 = Set[[1, 2], [3, 4]].to_h; p(v541)
p(Set[1, 2].to_h { |x| [x, x * 2] })
a541 = Set[1, 2]; v542 = a541.to_h { |x| [x, x * 2] }; p(v542)

# String elements
b541 = Set["a", "b"]; p(b541.to_h { |s| [s, s.upcase] })
