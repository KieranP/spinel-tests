# frozen_string_literal: true
# Hash#flat_map
p({ a: 1, b: 2 }.flat_map { |k, v| [k, v] })
a028 = { a: 1, b: 2 }; p(a028.flat_map { |k, v| [k, v] })
a029 = { a: 1, b: 2 }; c029 = (a029.flat_map { |k, v| [k, v] }); p c029

# flatten one level of array values
p({ a: [1, 2], b: [3, 4] }.flat_map { |_k, v| v })
fm1 = { a: [1, 2], b: [3, 4] }; fm2 = fm1.flat_map { |_k, v| v }; p fm2

# String keys, keys only
p({ "x" => 1, "y" => 2 }.flat_map { |k, _v| [k] })
fs1 = { "x" => 1, "y" => 2 }; fs2 = fs1.flat_map { |k, _v| [k] }; p fs2

# single-param binds the full [k,v] pair
p({ a: 1, b: 2 }.flat_map { |pair| pair })
fp1 = { a: 1, b: 2 }; fp2 = fp1.flat_map { |pair| pair }; p fp2

# non-array block result is not flattened
p({ a: 1, b: 2 }.flat_map { |k, _v| k })
fn1 = { a: 1, b: 2 }; fn2 = fn1.flat_map { |k, _v| k }; p fn2

emptyh_m = {}; p(emptyh_m.flat_map { |k, _v| [k] })
p({ a: 1, b: 2 }.flat_map.class)

# On a Hash returned by a seedless Array#reduce, a two-parameter block fails to
# compile, so the probe is kept commented out — it would take the whole file down.
a82fp = { n: 1, s: { x: 2 } }
h82fp = [a82fp].reduce { |acc82fp, l82fp| acc82fp }
r82fp = (h82fp.flat_map { |k82fp, v82fp| [k82fp] } rescue $!.class); p r82fp
# the destructured form compiles and runs
p(h82fp.flat_map { |(k82fpb, v82fpb)| [k82fpb] })
