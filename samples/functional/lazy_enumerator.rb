# frozen_string_literal: true
# Lazy enumerators: infinite sequences filtered and taken.
# first 5 squares of even numbers
evens_sq = (1..Float::INFINITY).lazy.select(&:even?).map { |n| n * n }.first(5)
p evens_sq

# first 5 multiples of 3 above 10
p (1..Float::INFINITY).lazy.map { |n| n * 3 }.select { |n| n > 10 }.first(5)

# lazy flat_map
p (1..3).lazy.flat_map { |n| [n, -n] }.first(6)

# take_while on lazy
p (1..Float::INFINITY).lazy.map { |n| n * n }.take_while { |n| n < 50 }.to_a

# Enumerator.new producing a custom sequence
fib = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y << a
    a, b = b, a + b
  end
end
p fib.first(10)
p fib.lazy.select(&:even?).first(4)

# chained lazy with with_index
result = (10..Float::INFINITY).lazy.select { |n| n % 7 == 0 }.first(3)
p result
