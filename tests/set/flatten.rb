# frozen_string_literal: true
require 'set'

# Set#flatten
p(Set[Set[1, 2], Set[3]].flatten.to_a.sort)
v017 = Set[Set[1, 2], Set[3]].flatten.to_a.sort; p(v017)

# nested Sets of strings
p(Set[Set["a", "b"], Set["c"]].flatten.to_a.sort)
a017 = Set[Set["a"], Set["b", "c"]]; b017 = (a017.flatten); p(b017.to_a.sort)

# deeper nesting
p(Set[Set[Set[1], Set[2]], Set[3]].flatten.to_a.sort)
