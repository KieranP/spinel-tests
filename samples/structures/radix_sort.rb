# frozen_string_literal: true
# LSD radix sort of non-negative integers using digit buckets.
# Inference: an Array of 10 bucket Arrays rebuilt each pass, digit extraction via
# integer division/modulo, and flatten to recombine.

def radix_sort(arr)
  return arr if arr.empty?
  max = arr.max
  exp = 1
  result = arr.dup
  while max / exp > 0
    buckets = Array.new(10) { [] }
    result.each do |n|
      digit = (n / exp) % 10
      buckets[digit] << n
    end
    result = buckets.flatten
    exp *= 10
  end
  result
end

data = [170, 45, 75, 90, 802, 24, 2, 66]
sorted = radix_sort(data)
puts "sorted: #{sorted.inspect}"
puts "matches Array#sort: #{sorted == data.sort}"

puts "already sorted: #{radix_sort([1, 2, 3]).inspect}"
puts "single digit: #{radix_sort([9, 3, 7, 1, 5]).inspect}"
puts "with dups: #{radix_sort([5, 3, 5, 1, 3]).inspect}"
puts "empty: #{radix_sort([]).inspect}"

# stability check via counting digit distribution
digit_counts = data.map { |n| n % 10 }.tally
puts "last-digit distribution: #{digit_counts.sort.inspect}"
p radix_sort([100, 10, 1])
p radix_sort([0, 0, 0])
