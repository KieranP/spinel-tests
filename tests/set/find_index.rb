# frozen_string_literal: true
require 'set'

# Set#find_index
p(Set[1, 2, 3].find_index(2))
v651 = Set[1, 2, 3].find_index(2); p(v651)
a651 = Set[1, 2, 3]; p(a651.find_index(9))
b651 = Set["a", "b"]; v652 = b651.find_index { |s| s == "b" }; p(v652)
