# frozen_string_literal: true
require 'set'

# Set#slice_after
p(Set[1, 2, 3, 4].slice_after { |x| x.even? }.to_a)
v861 = Set[1, 2, 3, 4].slice_after { |x| x.even? }.to_a; p(v861)
a861 = Set[1, 2, 3]; p(a861.slice_after(2).to_a)
b861 = Set["a", "bb", "c"]; v862 = b861.slice_after { |s| s.length == 2 }.to_a; p(v862)
