# frozen_string_literal: true
# Hash#sort
p({ b: 2, a: 1 }.sort)
a327 = { b: 2, a: 1 }; p(a327.sort)
a328 = { b: 2, a: 1 }; c328 = (a328.sort); p c328
p({ "b" => 2, "a" => 1 }.sort)
b327 = { "c" => 3, "a" => 1, "b" => 2 }; c427 = (b327.sort); p c427
p({ 3 => "c", 1 => "a", 2 => "b" }.sort)
b328 = { 3 => "c", 1 => "a", 2 => "b" }; c428 = (b328.sort); p c428
p({ c: 3, a: 1, b: 2 }.sort)
b329 = { c: 3, a: 1, b: 2 }; c429 = (b329.sort); p c429
p({ z: 1 }.sort)
b330 = { z: 1 }; c430 = (b330.sort); p c430
p({ a: 1, b: 2 }.sort { |x, y| y[1] <=> x[1] })
r167a = ([{ 20 => 2, 3 => 1 }].first.sort rescue $!.class); p r167a
