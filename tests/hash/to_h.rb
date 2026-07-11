# frozen_string_literal: true
# Hash#to_h
p({ a: 1, b: 2 }.to_h { |k, v| [k.to_s, v * 2] })
a313 = { a: 1, b: 2 }; p(a313.to_h { |k, v| [k.to_s, v * 2] })
a314 = { a: 1, b: 2 }; c314 = (a314.to_h { |k, v| [k.to_s, v * 2] }); p c314
a315 = { a: 1 }; c315 = (a315.to_h); p c315
p({ a: 1, b: 2 }.to_h)
za901 = { a: 1, b: 2 }.to_h; p za901
p({}.to_h)
za902 = {}.to_h; p za902
# String keys -> symbolize keys and scale values via a block, capture result
zh903 = { "a" => 1, "b" => 2 }; zr903 = zh903.to_h { |k, v| [k.to_sym, v * 10] }; p zr903
# swap key and value through the block (Integer keys result)
zh904 = { a: 1, b: 2 }; zr904 = zh904.to_h { |k, v| [v, k] }; p zr904
# rebuild via map-of-pairs then to_h (no block)
zh905 = { "x" => 1, "y" => 2 }; zr905 = zh905.map { |k, v| [k.to_sym, v + 100] }.to_h; p zr905

# On a Hash built by a seedless Array#reduce over merges.
h82th = [{ n: 1 }, { m: 2 }].reduce { |acc82th, l82th| acc82th.merge(l82th) }
r82th = (h82th.to_h rescue $!.class); p r82th
