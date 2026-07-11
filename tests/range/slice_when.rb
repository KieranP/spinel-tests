# frozen_string_literal: true
# Range#slice_when
r001 = ((1..10).slice_when { |i, j| j.even? }.to_a rescue $!.class); p r001
# char-range receiver works under both:
p(("a".."f").slice_when { |i, j| j == "d" }.to_a)
v002 = ("a".."f").slice_when { |i, j| j == "d" }.to_a; p v002
