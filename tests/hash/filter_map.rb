# frozen_string_literal: true
# Hash#filter_map
p({ a: 1, b: 2 }.filter_map { |k, v| k if v > 1 })
a024 = { a: 1, b: 2 }; p(a024.filter_map { |k, v| k if v > 1 })
a025 = { a: 1, b: 2 }; c025 = (a025.filter_map { |k, v| k if v > 1 }); p c025

# String keys, filter then keep key
p({ "x" => 5, "y" => 15 }.filter_map { |k, v| k if v > 10 })
fmps1 = { "x" => 5, "y" => 15 }; fmps2 = fmps1.filter_map { |k, v| k if v > 10 }; p fmps2

# transform and filter values
p({ a: 1, b: 2, c: 3 }.filter_map { |_k, v| v * 10 if v.odd? })
fmpv1 = { a: 1, b: 2, c: 3 }; fmpv2 = fmpv1.filter_map { |_k, v| v * 10 if v.odd? }; p fmpv2

# single-param binds the full [k,v] pair -> index it
p({ a: 1, b: 2 }.filter_map { |pair| pair[0] })
fmpp1 = { a: 1, b: 2 }; fmpp2 = fmpp1.filter_map { |pair| pair[0] }; p fmpp2

# Integer keys, keep all
p({ 1 => "a", 2 => "b" }.filter_map { |k, _v| k })
fmpi1 = { 1 => "a", 2 => "b" }; fmpi2 = fmpi1.filter_map { |k, _v| k }; p fmpi2

emptyh_p = {}; p(emptyh_p.filter_map { |k, _v| k })
p({ a: 1, b: 2 }.filter_map.class)
p({ a: 1, b: 2 }.filter_map { |_k, _v| nil })

# block returns an Array for kept entries, nil for rejected ones
p({ a: 1, b: 2, c: 3, d: 4 }.filter_map { |k, v| [k, v] if v.even? })
fmar1 = { a: 1, b: 2, c: 3, d: 4 }; fmar2 = fmar1.filter_map { |k, v| [k, v] if v.even? }; p fmar2
p({ a: 1, b: 2, c: 3, d: 4 }.filter_map { |k, v| v.even? ? [k, v] : nil })
fmar3 = { a: 1, b: 2, c: 3, d: 4 }; fmar4 = fmar3.filter_map { |k, v| v.even? ? [k, v] : nil }; p fmar4

# On a Hash returned by a seedless Array#reduce.
a82fm = { n: 1, s: { x: 2 } }
h82fm = [a82fm].reduce { |acc82fm, l82fm| acc82fm }
r82fm = (h82fm.filter_map { |k82fm, v82fm| k82fm } rescue $!.class); p r82fm
