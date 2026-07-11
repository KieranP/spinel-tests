# frozen_string_literal: true
# Enumerator::Yielder#yield
p(Enumerator.new { |y| y.yield(1); y.yield(2) }.to_a)
v001 = Enumerator.new { |y| y.yield 3; y.yield 4 }.to_a; p(v001)
# yield with several values packs them into one element
p(Enumerator.new { |y| y.yield(1, 2); y.yield(3, 4) }.to_a)
p(Enumerator.new { |y| y.yield(1, 2) }.next)
p(Enumerator.new { |y| y.yield(1, 2) }.next_values)
# the value #yield returns is whatever #feed supplied
e002 = Enumerator.new { |y| got002 = y.yield(1); p [:got, got002]; y.yield(2) }
e002.next; e002.feed(99); e002.next
