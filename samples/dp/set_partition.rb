# frozen_string_literal: true
# Set operations: classify numbers, set algebra, subset checks.
require 'set'

nums = (1..30).to_a
primes = Set.new(nums.select { |n| n > 1 && (2...n).none? { |d| n % d == 0 } })
evens = Set.new(nums.select(&:even?))
squares = Set.new(nums.select { |n| Math.sqrt(n).to_i**2 == n })

puts "primes: #{primes.to_a.sort.inspect}"
puts "even primes: #{(primes & evens).to_a.sort.inspect}"
puts "odd non-primes: #{(nums.to_set - primes - evens).to_a.sort.first(5).inspect}"
puts "squares subset of nums? #{squares.subset?(nums.to_set)}"
puts "prime or square count: #{(primes | squares).size}"

grouped = nums.group_by { |n| n % 3 }
grouped.each { |k, v| puts "mod3=#{k}: #{v.length}" }
