# frozen_string_literal: true
# Enumerator — chaining to #to_a
p([1, 2].cycle(2).to_a)
v015 = [1, 2].cycle(2).to_a; p(v015)
a008 = [1, 2]; p(a008.cycle(2).to_a)
