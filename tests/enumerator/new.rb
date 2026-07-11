# frozen_string_literal: true
# Enumerator.new
p(Enumerator.new { |y| y << 1; y << 2 }.to_a)
v004 = Enumerator.new { |y| y << 1; y << 2 }; p(v004.to_a)
a003 = Enumerator.new { |y| y << 10; y << 20; y << 30 }; p(a003.next); p(a003.next)
v005 = Enumerator.new { |y| y << 5 }.to_a; p(v005)
# with an explicit size hint
a006 = Enumerator.new(3) { |y| y << 1; y << 2; y << 3 }; p(a006.size)
# infinite size hint on a generator
b006 = Enumerator.new(Float::INFINITY) { |y| i = 0; loop { y << (i += 1) } }; p(b006.size); p(b006.first(3))
# explicit size argument and a size lambda
p(Enumerator.new(2) { |y| y << 1; y << 2 }.size)
p(Enumerator.new(-> { 3 }) { |y| y << 1; y << 2; y << 3 }.size)
# Enumerable methods over a generator
p(Enumerator.new { |y| y << 1; y << 2 }.inject(:+))
p(Enumerator.new { |y| y << 1; y << 2 }.map { |x| x * 2 })
p(Enumerator.new { |y| y << 1; y << 2 }.select { |x| x.even? })
p(Enumerator.new { |y| y << 1; y << 2 }.lazy.map { |x| x * 3 }.to_a)
# break out of a generator's #each
p(Enumerator.new { |y| y << 1; y << 2; y << 3 }.each { |x| break x * 10 })
# a generator body that raises StopIteration ends the enumeration
g007 = Enumerator.new { |y| y << 1; raise StopIteration; y << 2 }; p(g007.to_a)
# an infinite generator truncated by take / first / lazy
p(Enumerator.new { |y| i008 = 0; loop { y << (i008 += 1) } }.take(4))
p(Enumerator.new { |y| i009 = 0; loop { y << (i009 += 1) } }.first(4))
p(Enumerator.new { |y| i010 = 0; loop { y << (i010 += 1) } }.lazy.select { |x| x.even? }.first(3))
