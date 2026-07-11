# frozen_string_literal: true
# Hash#reduce
p({ a: 1, b: 2 }.reduce(0) { |acc, (_k, v)| acc + v })
a054 = { a: 1, b: 2 }; p(a054.reduce(0) { |acc, (_k, v)| acc + v })
a055 = { a: 1, b: 2 }; c055 = (a055.reduce(0) { |acc, (_k, v)| acc + v }); p c055
p({ "a" => 1, "b" => 2, "c" => 3 }.reduce(0) { |acc, (_k, v)| acc + v })
b054 = { "a" => 1, "b" => 2 }; c154 = (b054.reduce(10) { |acc, (_k, v)| acc + v }); p c154
p({ a: 2, b: 3, c: 4 }.reduce(1) { |acc, (_k, v)| acc * v })
b055 = { a: 2, b: 3 }; c155 = (b055.reduce(1) { |acc, (_k, v)| acc * v }); p c155
p({ a: 1, b: 2, c: 3 }.reduce([]) { |acc, (k, _v)| acc << k })
b056 = { a: 1, b: 2 }; c156 = (b056.reduce([]) { |acc, (k, _v)| acc << k }); p c156
p({ x: 1.5, y: 2.5 }.reduce(0.0) { |acc, (_k, v)| acc + v })
b057 = { x: 1.5, y: 2.5 }; c157 = (b057.reduce(0.0) { |acc, (_k, v)| acc + v }); p c157
p({ a: 5 }.reduce(100) { |acc, (_k, v)| acc - v })
b058 = { a: 5 }; c158 = (b058.reduce(100) { |acc, (_k, v)| acc - v }); p c158
emptyh_r = {}; p(emptyh_r.reduce(0) { |acc, (_k, v)| acc + v })
# reduce with a Hash.new(0) accumulator, tallying repeated keys (returns the accumulator each step)
zh501 = { a: 1, b: 2, c: 3 }; zr501 = zh501.reduce(Hash.new(0)) { |acc, (_k, v)| acc[v.even? ? :even : :odd] += v; acc }; p zr501.sort.to_h
# reduce building a String from mixed-type pairs
zh502 = { a: 1, b: 2 }; zr502 = zh502.reduce("") { |acc, (k, v)| acc + "#{k}#{v}" }; p zr502

# On a Hash returned by a seedless Array#reduce.
a82rd = { n: 1, s: { x: 2 } }
h82rd = [a82rd].reduce { |acc82rd, l82rd| acc82rd }
r82rd = (h82rd.reduce(0) { |m82rd, _p82rd| m82rd + 1 } rescue $!.class); p r82rd

# reduce with a Symbol operator and no block is refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
p({ a: 1, b: 2 }.reduce(:+))
a477 = { a: 1, b: 2 }; c477 = (a477.reduce(:+)); p c477

# reduce over container values, accumulating into an Array with `+`, emits
# ill-typed C. Kept commented: the compile abort takes down the whole file.
p({ a: [1, 2], b: [3] }.reduce([]) { |acc478, (_k478, v478)| acc478 + v478 })
b478 = { a: [1, 2], b: [3] }; c478 = (b478.reduce([]) { |acc, (_k, v)| acc + v }); p c478
# Control: #concat and << over the same receiver compile and match.
p({ a: [1, 2], b: [3] }.reduce([]) { |acc479, (_k479, v479)| acc479.concat(v479) })
b479 = { a: [1, 2] }; c479 = (b479.reduce([]) { |acc, (k, _v)| acc << k }); p c479
# reduce into a Hash accumulator, reading a value back through a local
d479 = { a: 1, b: 2 }.reduce({}) { |acc479, (k479, v479)| acc479[v479] = k479; acc479 }
p d479
e479 = d479[1]; p e479
