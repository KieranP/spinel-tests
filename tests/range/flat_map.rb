# frozen_string_literal: true
# Range#flat_map
p((1..3).flat_map { |n| [n, n] })
a017 = (1..3); p(a017.flat_map { |n| [n, n] })
a018 = (1..3); c018 = (a018.flat_map { |n| [n, n] }); p c018
p((1..3).flat_map { |n| n })
p((1...4).flat_map { |n| [n, -n] })
p((5..1).flat_map { |n| [n] })
p(("a".."c").flat_map { |s| [s, s] })
