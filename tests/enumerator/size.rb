# frozen_string_literal: true
# Enumerator#size
p([1, 2, 3].each.size)
v009 = [1, 2, 3].each.size; p(v009)
a006 = [1, 2, 3]; p(a006.each.size)
p((1..10).each.size)
v010 = (1..10).each.size; p(v010)
# size of a string char enumerator and an each_with_index enumerator
p("abc".each_char.size)
p([1, 2, 3].each_with_index.size)
# size of a generator with no known length is nil
p(Enumerator.new { |y| y << 1 }.size)
# size of each_slice / each_cons and with_index enumerators
p([1, 2, 3, 4, 5].each_slice(2).size)
p([1, 2, 3, 4, 5].each_cons(2).size)
p([1, 2, 3].each.with_index.size)
p([1, 2, 3].map.with_index.size)
# Enumerator::Lazy#size
p((1..10).lazy.size)
p([1, 2, 3].lazy.size)
# a generator with an explicit size argument, and with a size lambda
p(Enumerator.new(2) { |y| y << 1; y << 2 }.size)
p(Enumerator.new(-> { 3 }) { |y| y << 1; y << 2; y << 3 }.size)
v900 = Enumerator.new(2) { |y| y << 1; y << 2 }.size; p(v900)
# size of a lazy chain, finite and infinite
p((1..Float::INFINITY).lazy.size)
p([1, 2, 3].lazy.map { |x900| x900 }.size)
# size of a concatenated enumerator
p(([1, 2].each + [3].each).size)
