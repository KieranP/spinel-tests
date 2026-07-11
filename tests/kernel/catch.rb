# frozen_string_literal: true
# Kernel#catch
r351 = catch(:done) do
  10.times { |i| throw :done, i if i == 3 }
  :never
end
p r351
p(catch(:x) { 42 })
v352 = catch(:y) { throw :y, "hi" }; p v352

# a generated tag, a String tag and an object tag
p(catch { |t| throw t, 7 })
v353 = catch { |t| throw t, 8 }; p v353
p(catch("str") { throw "str", 1 })
v354 = catch("str") { throw "str", 2 }; p v354
o355 = Object.new
p(catch(o355) { throw o355, 3 })
v355 = catch(o355) { throw o355, 4 }; p v355

# nested catches: the inner throw is caught by whichever tag names it
p(catch(:a) { catch(:b) { throw :a, 5 }; 6 })
v356 = catch(:a) { catch(:b) { throw :b, 7 }; 8 }; p v356

# a throw crossing a method boundary, and one out of an iterator block
def cross357; throw :cross, 9; end
p(catch(:cross) { cross357; 10 })
v357 = catch(:cross) { cross357; 11 }; p v357
p(catch(:f) { [1, 2, 3].each { |i| throw :f, i * 10 if i == 2 }; :no })
v358 = catch(:g) { { a: 1, b: 2 }.each { |k, v| throw :g, k if v == 2 }; :no }; p v358
p(catch(:h) { (1..Float::INFINITY).each { |i| throw :h, i if i > 3 }; :no })
p(catch(:k) { loop { throw :k, :done } })
v359 = catch(:j) { 1.upto(5) { |i| throw :j, i if i == 4 } }; p v359

# ensure still runs on the way out; a catch that is never thrown to answers its block
p(catch(:e) { begin; throw :e, 1; ensure; puts "ens"; end })
p(catch(:z) { 12 })
v360 = catch(:z2) { 13 }; p v360

# a catch whose block VALUE is an Array#each / Range#each call does not build
p(catch(:m) { [1, 2].each { |i| throw :m, i } })
p(catch(:n) { (1..2).each { throw :n, 7 } })
p(catch(:m) { [1, 2].each { |i| throw :m, i }; :no })
v370 = catch(:m2) { x370 = [1, 2].each { |i| throw :m2, i }; x370 }; p v370
# even bound to a local first, the Range#each form is still refused:
v371 = catch(:n) { x371 = (1..2).each { throw :n, 7 }; x371 }; p v371
