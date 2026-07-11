# frozen_string_literal: true
# Range#reverse_each
(1..5).reverse_each { |n| print n }; puts
v008 = (1..5); v008.reverse_each { |n| print n }; puts
r009 = []; (1..5).reverse_each { |n| r009 << n }; p r009
p((1..3).reverse_each.to_a)
v010 = ((1..3).reverse_each.to_a); p(v010)
p((1...5).reverse_each.to_a)

# An inline Range whose bound was read out of a NESTED array compiles, but is
# typed `unknown`, so chaining raises NoMethodError. Rescue-wrapped to stay live.
rows873 = [[2026, 5, 1]]
m873 = rows873[0][1]
r873 = ((1...m873).reverse_each.to_a rescue $!.class); p r873

v005 = ((1..5).reverse_each.to_a); p v005
p((1...5).reverse_each.to_a)
p(("a".."e").reverse_each.to_a)
r006 = []; (..5).reverse_each { |x006| break if x006 < 3; r006 << x006 }; p r006
