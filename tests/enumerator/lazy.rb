# frozen_string_literal: true
# Enumerator#lazy
p((1..Float::INFINITY).lazy.map { |x| x * 2 }.first(3))
v006 = (1..Float::INFINITY).lazy.map { |x| x * 2 }.first(3); p(v006)
p((1..Float::INFINITY).lazy.select { |x| x.even? }.first(3))
v007 = (1..Float::INFINITY).lazy.select { |x| x.even? }.first(3); p(v007)
r002 = (1..Float::INFINITY); p(r002.lazy.map { |x| x * 3 }.first(2))
p([1, 2, 3, 4].lazy.filter_map { |x| x }.to_a)
v008 = [1, 2, 3, 4].lazy.filter_map { |x| x }.to_a; p(v008)
p([1, 2, 3].lazy.flat_map { |x| [x, x] }.to_a)
v009 = [1, 2, 3].lazy.flat_map { |x| [x, x] }.to_a; p(v009)
p((2..Float::INFINITY).lazy.select { |n593| (2..Math.sqrt(n593)).none? { |d593| n593 % d593 == 0 } }.first(5))
v593 = (2..Float::INFINITY).lazy.select { |n593| (2..Math.sqrt(n593)).none? { |d593| n593 % d593 == 0 } }.first(5); p v593

p (2..10).lazy.each_cons(2).first(3)
v594 = (2..10).lazy.each_cons(2).first(3); p v594

# a lazy taken off an external Enumerator
p([1, 2, 3].each.lazy.first(2))
v100 = [1, 2, 3].each.lazy.first; p(v100)
p(Enumerator.new { |y| y << 1; y << 2 }.lazy.first(1))
p([1, 2, 3].each.lazy.to_a)
p([1, 2, 3].each.lazy.map { |x101| x101 * 2 }.first(2))
p((1..3).each.lazy.first(2))
# endless-range sources
p((1..).lazy.select { |x102| x102 % 7 == 0 }.first(2))
p((1..Float::INFINITY).lazy.map { |x103| x103 * 2 }.select { |x103b| x103b % 3 == 0 }.reject { |x103c| x103c < 10 }.take(3).force)
# a String-char source
p("abcd".each_char.lazy.select { |c104| c104 < "c" }.to_a)
# a lazy chain built inside another lazy chain's map block
p([1, 2].lazy.map { |x105| [1, 2].lazy.map { |y105| y105 }.to_a }.to_a)
p((1..3).lazy.map { |x106| (1..x106).lazy.to_a }.to_a)
# the same inner chain under an EAGER outer map compiles and matches
p((1..3).map { |x107| (1..x107).lazy.map { |y107| y107 * 2 }.to_a })
