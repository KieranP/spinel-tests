# frozen_string_literal: true
# Enumerator::Yielder#to_proc
p(Enumerator.new { |y| [1, 2, 3].each(&y) }.to_a)
v001 = Enumerator.new { |y| [4, 5].each(&y) }.to_a; p(v001)
p(Enumerator.new { |y| [1, 2, 3].map(&y) }.to_a)

p(Enumerator.new { |y| y.to_proc.call(1) }.to_a)
