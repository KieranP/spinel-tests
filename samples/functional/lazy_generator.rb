# frozen_string_literal: true
# Lazy generator with Enumerator.new + next/take
fib = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y << a
    a, b = b, a + b
  end
end

p fib.take(10)
p fib.first(5)

e = Enumerator.new do |y|
  y.yield 1
  y.yield 2
  y.yield 3
end
p e.next
p e.next
p e.next

evens = Enumerator.new do |y|
  n = 0
  loop { y << n; n += 2 }
end
p evens.lazy.select { |x| x % 3 == 0 }.first(4)
