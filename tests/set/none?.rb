# frozen_string_literal: true
require 'set'

# Set#none?
p(Set[1, 2].none? { |x| x > 5 })
v621 = Set[1, 2].none? { |x| x > 1 }; p(v621)
p(Set[].none?)
a621 = Set[1, 2]; v622 = a621.none?; p(v622)

# String elements
b621 = Set["a", "bb"]; p(b621.none? { |s| s.empty? })
