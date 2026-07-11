# frozen_string_literal: true
require 'set'

# Set#each_cons
p(Set[1, 2, 3, 4].each_cons(2).to_a)
v721 = Set[1, 2, 3, 4].each_cons(2).to_a; p(v721)
acc721 = []; Set[1, 2, 3].each_cons(2) { |c| acc721 << c }; p(acc721)
a721 = Set["a", "b", "c"]; v722 = a721.each_cons(3).to_a; p(v722)
