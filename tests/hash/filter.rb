# frozen_string_literal: true
# Hash#filter
p({ a: 1, b: 2 }.filter { |_k, v| v > 1 })
a329 = { a: 1, b: 2 }; p(a329.filter { |_k, v| v > 1 })
a330 = { a: 1, b: 2 }; c330 = (a330.filter { |_k, v| v > 1 }); p c330

# String keys, Integer values
p({ "x" => 10, "y" => 20, "z" => 5 }.filter { |_k, v| v >= 10 })
fsk1 = { "x" => 10, "y" => 20, "z" => 5 }; fsc1 = fsk1.filter { |_k, v| v >= 10 }; p fsc1

# Integer keys, key predicate
p({ 1 => "a", 2 => "b", 3 => "c" }.filter { |k, _v| k.odd? })
fik1 = { 1 => "a", 2 => "b", 3 => "c" }; fic1 = fik1.filter { |k, _v| k.odd? }; p fic1

# single-param block binds the KEY (not the [k,v] pair)
p({ 1 => 10, 2 => 20, 3 => 30 }.filter { |k| k > 1 })
fkf1 = { 1 => 10, 2 => 20, 3 => 30 }; fkc1 = fkf1.filter { |k| k > 1 }; p fkc1

# String values
p({ a: "foo", b: "ab" }.filter { |_k, v| v.length == 3 })
fsv1 = { a: "foo", b: "ab" }; fsv2 = fsv1.filter { |_k, v| v.length == 3 }; p fsv2

# single-entry hash
p({ only: 1 }.filter { |_k, v| v > 0 })
fse1 = { only: 1 }; fse2 = fse1.filter { |_k, v| v > 0 }; p fse2

# none match
p({ a: 1, b: 2 }.filter { |_k, v| v > 100 })
fnm1 = { a: 1, b: 2 }; fnm2 = fnm1.filter { |_k, v| v > 100 }; p fnm2

emptyh_f = {}; p(emptyh_f.filter { |_k, v| v > 0 })
p({ a: 1, b: 2 }.filter.class)
