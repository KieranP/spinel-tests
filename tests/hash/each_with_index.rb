# frozen_string_literal: true
# Hash#each_with_index
a821 = { a: 1, b: 2 }; out821 = []; a821.each_with_index { |pair, i| out821 << [pair, i] }; p out821
out822 = []; { a: 1, b: 2 }.each_with_index { |pair, i| out822 << [pair, i] }; p out822

a823 = { a: 1, b: 2 }; p(a823.each_with_index.to_a)

# three entries, collect pairs with their index
ewi01 = { a: 1, b: 2, c: 3 }; out901 = []; ewi01.each_with_index { |pair, i| out901 << [pair, i] }; p out901
# destructure the pair into key and value alongside the index
ewi02 = { a: 1, b: 2 }; out902 = []; ewi02.each_with_index { |(k, v), i| out902 << [i, k, v] }; p out902
# String keys
ewi03 = { "x" => 10, "y" => 20 }; out903 = []; ewi03.each_with_index { |pair, i| out903 << [pair, i] }; p out903
# Integer keys
ewi04 = { 1 => "a", 2 => "b" }; out904 = []; ewi04.each_with_index { |pair, i| out904 << [pair, i] }; p out904
# single entry
ewi05 = { z: 9 }; out905 = []; ewi05.each_with_index { |pair, i| out905 << [pair, i] }; p out905
# return value is the receiver
ewi06 = { a: 1, b: 2 }; ewi06r = (ewi06.each_with_index { |_pair, _i| nil }); p ewi06r
# blockless enumerator captured, then materialized
ewi07 = { a: 1, b: 2 }; ewi07e = ewi07.each_with_index; p(ewi07e.to_a)
