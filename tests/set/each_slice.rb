# frozen_string_literal: true
require 'set'

# Set#each_slice
p(Set[1, 2, 3, 4].each_slice(2).to_a)
v711 = Set[1, 2, 3, 4].each_slice(2).to_a; p(v711)
acc711 = []; Set[1, 2, 3].each_slice(2) { |s| acc711 << s }; p(acc711)
a711 = Set["a", "b", "c"]; v712 = a711.each_slice(2).to_a; p(v712)
