# frozen_string_literal: true
# Lazy enumeration: Enumerator::Lazy select/map/reject/take/first over an
# infinite integer source. Inference: lazy chains that never fully materialize.

primes = (2..Float::INFINITY).lazy.select do |n|
  (2..Math.sqrt(n)).none? { |d| n % d == 0 }
end

p primes.first(8)
p primes.first(8).map { |x| x * x }

squares = (1..Float::INFINITY).lazy.map { |n| n * n }
p squares.take(6).to_a
p squares.select { |s| s.even? }.first(4)

# filter_map lazily.
fm = (1..Float::INFINITY).lazy.filter_map { |n| n * 10 if n.odd? }
p fm.first(5)

# lazy over a finite range chained with reject.
r = (1..20).lazy.reject { |n| n % 3 == 0 }.map { |n| n + 1 }
p r.first(5)
p r.to_a

# zip inside lazy.
z = (1..Float::INFINITY).lazy.map { |n| [n, n * n] }.first(4)
p z
