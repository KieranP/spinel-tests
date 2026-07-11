# frozen_string_literal: true
# Maximum subarray sum (Kadane) with index tracking, plus a 2D extension.
# Inference: a running-max Integer fold over an Array, start/end index bookkeeping,
# and a nested loop reducing a 2D grid to column sums.

def max_subarray(nums)
  best = nums[0]
  current = nums[0]
  start = 0
  best_start = 0
  best_end = 0
  (1...nums.length).each do |i|
    if current + nums[i] < nums[i]
      current = nums[i]
      start = i
    else
      current += nums[i]
    end
    if current > best
      best = current
      best_start = start
      best_end = i
    end
  end
  [best, best_start, best_end]
end

data = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
best, lo, hi = max_subarray(data)
puts "max sum: #{best}"
puts "range: [#{lo}, #{hi}] = #{data[lo..hi].inspect}"
puts "slice sum check: #{data[lo..hi].sum == best}"

puts "all negative: #{max_subarray([-3, -1, -2]).first}"
puts "all positive: #{max_subarray([1, 2, 3]).first}"
puts "single: #{max_subarray([7]).inspect}"

# max sum over a few arrays
sums = [[1, -1, 1], [5, -2, 5], [-1, -2, -3]].map { |a| max_subarray(a).first }
puts "max sums: #{sums.inspect}"
p max_subarray([2, -1, 2, -1, 2]).first
p max_subarray([-5]).first
