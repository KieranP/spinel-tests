# frozen_string_literal: true
# Hash#fetch_values (with block for a missing key)
p({ a: 1 }.fetch_values(:a, :z) { |k| k.to_s })
a119 = { a: 1 }; r119b = a119.fetch_values(:a, :z) { |k| k.to_s }; p r119b

# On a Hash returned by a seedless Array#reduce.
a82fv = { n: 1, s: { x: 2 } }
h82fv = [a82fv].reduce { |acc82fv, l82fv| acc82fv }
r82fv = (h82fv.fetch_values(:n) rescue $!.class); p r82fv
