# frozen_string_literal: true
# Enumerator#first / Enumerator::Lazy#first
# counted form first(n) works on external Enumerators and lazy chains:
p([1, 2, 3].each.first(2))
v001 = [1, 2, 3].each.first(2); p(v001)
a001 = [10, 20, 30]; p(a001.each.first(1))
p([1, 2, 3, 4].lazy.map { |x| x * 2 }.first(2))
v002 = [1, 2, 3, 4].lazy.map { |x| x * 2 }.first(2); p(v002)
# first(n) truncating an infinite lazy source
p((1..Float::INFINITY).lazy.select { |x| x.even? }.first(3))
# first(0) is an empty array
p([1, 2, 3].each.first(0))
p([1, 2, 3].each.first)
v003 = [1, 2, 3].each.first; p(v003)
p([1, 2, 3].lazy.map { |x| x * 2 }.first)

# Enumerator::Lazy#first with NO argument on an Array-sourced lazy silently
# returns nil. Runtime value difference, so it stays live.
p([1, 2, 3].lazy.first)
f188 = [1, 2, 3].lazy.first; p f188
# a Range-sourced lazy is correct, as is the counted form:
p((1..3).lazy.first)
p([1, 2, 3].lazy.first(2))

# first on the lazy of an external Enumerator
p([1, 2, 3].each.lazy.first(2))
p([1, 2, 3].each.lazy.first)
v100 = [1, 2, 3].each.lazy.first(2); p(v100)
# first over an infinite generator
p(Enumerator.new { |y| i101 = 0; loop { y << (i101 += 1) } }.first(4))
p(Enumerator.produce(1) { |n102| n102 + 1 }.first(3))
