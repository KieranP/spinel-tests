# frozen_string_literal: true
# Hash#drop
p({ a: 1, b: 2, c: 3 }.drop(1))
d1 = { a: 1, b: 2, c: 3 }; d2 = (d1.drop(1)); p d2
p({ a: 1, b: 2, c: 3 }.drop(0))
za901 = { a: 1, b: 2, c: 3 }; zb901 = (za901.drop(0)); p zb901
p({ a: 1, b: 2, c: 3 }.drop(5))
za902 = { a: 1, b: 2, c: 3 }; zb902 = (za902.drop(5)); p zb902
p({}.drop(2))
za903 = {}; zb903 = (za903.drop(2)); p zb903

# On a Hash returned by a seedless Array#reduce.
a82dp = { n: 1, s: { x: 2 } }
h82dp = [a82dp].reduce { |acc82dp, l82dp| acc82dp }
r82dp = (h82dp.drop(1) rescue $!.class); p r82dp
