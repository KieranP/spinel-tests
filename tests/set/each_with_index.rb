# frozen_string_literal: true
require 'set'

# Set#each_with_index
acc571 = []; Set[10, 20].each_with_index { |x, i| acc571 << [x, i] }; p(acc571)
a571 = Set[10, 20]; v571 = a571.each_with_index.to_a; p(v571)

# String elements
acc572 = []; Set["a", "b"].each_with_index { |s, i| acc572 << "#{i}#{s}" }; p(acc572)
b571 = Set["a", "b"]; v572 = b571.each_with_index.map { |s, i| [i, s] }; p(v572)
