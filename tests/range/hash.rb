# frozen_string_literal: true
# Range#hash
p((1..3).hash.is_a?(Integer))
a022 = (1..3); p(a022.hash == a022.hash)
a023 = (1..3); v023 = (a023.hash.is_a?(Integer)); p v023

p((1..3).hash == (1..3).hash)
p((1..3).hash == (1..4).hash)
p((1..3).hash == (1...3).hash)
h024 = { (1..3) => :a, (4..6) => :b }
p h024.size
p h024.keys
p h024[(1..3)]
p h024.key?(4..6)
v025 = (h024.fetch(1..3) rescue $!.class); p v025
h026 = {}; h026[(1..3)] = :a; p h026[(1..3)]
k027 = ("a".."c"); h027 = { k027 => :s }; p h027[k027]
