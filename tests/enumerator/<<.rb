# frozen_string_literal: true
# Enumerator::Yielder#<<
p(Enumerator.new { |y| y << 1; y << 2 }.to_a)
v001 = Enumerator.new { |y| y << 1; y << 2 }.to_a; p(v001)
p(Enumerator.new { |y| y << "a"; y << "b" }.to_a)
p(Enumerator.new { |y| y << [1, 2] }.to_a)
a002 = [10, 20, 30]; p(Enumerator.new { |y| a002.each { |x| y << x } }.to_a)
g003 = Enumerator.new { |y| 3.times { |i| y << i } }; p(g003.to_a)
v004 = Enumerator.new { |y| y << 7 }; p(v004.next)
# << returns the yielder, so the pushes can be chained
p(Enumerator.new { |y| y << 1 << 2 }.to_a)
p(Enumerator.new { |y| y << "a" << "b" }.to_a)
p(Enumerator.new { |y| (y << 1) << 2 }.to_a)
