# frozen_string_literal: true
# Hash#tally
p({ a: 1, b: 1 }.tally)
ty1 = { a: 1, b: 1 }; ty2 = (ty1.tally); p ty2

# On a Hash returned by a seedless Array#reduce.
a82ty = { n: 1, s: { x: 2 } }
h82ty = [a82ty].reduce { |acc82ty, l82ty| acc82ty }
r82ty = (h82ty.tally.size rescue $!.class); p r82ty
