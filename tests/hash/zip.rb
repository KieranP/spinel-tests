# frozen_string_literal: true
# Hash#zip
p({ a: 1, b: 2 }.zip([10, 20]))
z1 = { a: 1, b: 2 }; z2 = (z1.zip([10, 20])); p z2

# On a Hash returned by a seedless Array#reduce.
a82zp = { n: 1, s: { x: 2 } }
h82zp = [a82zp].reduce { |acc82zp, l82zp| acc82zp }
r82zp = (h82zp.zip([1]) rescue $!.class); p r82zp
