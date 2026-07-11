# frozen_string_literal: true
# Range#each_with_index
(1..5).each_with_index { |x, i| p [x, i] }
p((1..5).each_with_index.to_a)
v070 = (1..5).each_with_index.to_a; p(v070)

r001 = []; (1..3).each_with_index { |x001, i001| r001 << [x001, i001] }; p r001
v002 = ((1..3).each_with_index.to_a); p v002
r003 = ((1..).each_with_index.first(2) rescue $!.class); p r003
