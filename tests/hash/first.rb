# frozen_string_literal: true
# Hash#first
p({ a: 1, b: 2 }.first)
f1 = { a: 1, b: 2 }; f2 = (f1.first); p f2
p({ a: 1, b: 2 }.first(1))
p({ a: 1, b: 2 }.first(0))
za901 = { a: 1, b: 2 }.first(0); p za901
p({ a: 1, b: 2 }.first(5))
za902 = { a: 1, b: 2 }.first(5); p za902
p({}.first)
za903 = {}.first; p za903
p({ a: 1, b: 2, c: 3 }.first(2))
za904 = { a: 1, b: 2, c: 3 }.first(2); p za904

# On a Hash returned by a seedless Array#reduce.
a82fs = { n: 1, s: { x: 2 } }
h82fs = [a82fs].reduce { |acc82fs, l82fs| acc82fs }
r82fs = (h82fs.first rescue $!.class); p r82fs
