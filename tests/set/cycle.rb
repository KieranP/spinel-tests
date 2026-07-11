# frozen_string_literal: true
require 'set'

# Set#cycle
sum761 = 0; Set[1, 2].cycle(2) { |x| sum761 += x }; p(sum761)
a761 = Set[1, 2]; acc761 = []; a761.cycle(1) { |x| acc761 << x }; p(acc761)

# cycle 0 times yields nothing
acc762 = []; Set[1, 2].cycle(0) { |x| acc762 << x }; p(acc762)
b761 = Set["a"]; v761 = b761.cycle(3).to_a; p(v761)
