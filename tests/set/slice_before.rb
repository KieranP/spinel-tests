# frozen_string_literal: true
require 'set'

# Set#slice_before
p(Set[1, 2, 3, 4].slice_before { |x| x.even? }.to_a)
v851 = Set[1, 2, 3, 4].slice_before { |x| x.even? }.to_a; p(v851)
a851 = Set[1, 2, 3]; p(a851.slice_before(2).to_a)
b851 = Set["a", "bb", "c"]; v852 = b851.slice_before { |s| s.length == 2 }.to_a; p(v852)
