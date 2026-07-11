# frozen_string_literal: true
require 'set'

# Set#slice_when
p(Set[1, 2, 4, 5].slice_when { |x, y| y != x + 1 }.to_a)
v741 = Set[1, 2, 4, 5].slice_when { |x, y| y != x + 1 }.to_a; p(v741)
a741 = Set[1, 2, 3]; p(a741.slice_when { |x, y| true }.to_a)
b741 = Set["a", "b", "z"]; v742 = b741.slice_when { |x, y| y.ord != x.ord + 1 }.to_a; p(v742)
