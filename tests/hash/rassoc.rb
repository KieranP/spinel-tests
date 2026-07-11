# frozen_string_literal: true
# Hash#rassoc
p({ "a" => 1, "b" => 2 }.rassoc(2))
a334 = { "a" => 1, "b" => 2 }; p(a334.rassoc(2))
a335 = { "a" => 1, "b" => 2 }; b335 = 2; p(a335.rassoc(b335))
a336 = { "a" => 1, "b" => 2 }; b336 = 2; c336 = (a336.rassoc(b336)); p c336
p({ "a" => 1, "b" => 2 }.rassoc(9))
za901 = { "a" => 1, "b" => 2 }.rassoc(9); p za901
p({ "a" => 1, "b" => 1 }.rassoc(1))
za902 = { "a" => 1, "b" => 1 }.rassoc(1); p za902
p({}.rassoc(1))
za903 = {}.rassoc(1); p za903

# On a Hash returned by a seedless Array#reduce.
a82ra = { n: 1, s: { x: 2 } }
h82ra = [a82ra].reduce { |acc82ra, l82ra| acc82ra }
r82ra = (h82ra.rassoc(1) rescue $!.class); p r82ra
