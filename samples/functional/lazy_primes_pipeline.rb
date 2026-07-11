# frozen_string_literal: true
# Lazy pipeline: infinite naturals -> filter primes -> map -> take.
primes = (2..Float::INFINITY).lazy.select do |n|
  (2...n).none? { |d| n % d == 0 }
end

first10 = primes.first(10)
puts "first 10 primes: #{first10.inspect}"

squared = primes.map { |p| p * p }.first(5)
puts "prime squares: #{squared.inspect}"

twin = primes.each_cons(2).lazy.select { |a, b| b - a == 2 }.first(3)
puts "twin pairs: #{twin.inspect}"

evens = (1..Float::INFINITY).lazy.map { |n| n * 2 }
puts "first 5 evens: #{evens.first(5).inspect}"
puts "sum of first 4 prime squares: #{primes.map { |p| p * p }.first(4).sum}"
