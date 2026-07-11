# frozen_string_literal: true
# Longest increasing subsequence: length via DP, plus reconstruction.
# Inference: parallel Integer DP + predecessor arrays, nested comparison loops,
# and a backtrack that walks predecessors into a reversed result.

def lis(nums)
  return [] if nums.empty?
  n = nums.length
  lengths = Array.new(n, 1)
  prev = Array.new(n, -1)

  (1...n).each do |i|
    (0...i).each do |j|
      if nums[j] < nums[i] && lengths[j] + 1 > lengths[i]
        lengths[i] = lengths[j] + 1
        prev[i] = j
      end
    end
  end

  best = (0...n).max_by { |i| lengths[i] }
  seq = []
  k = best
  while k != -1
    seq << nums[k]
    k = prev[k]
  end
  seq.reverse
end

data = [10, 9, 2, 5, 3, 7, 101, 18]
result = lis(data)
puts "input: #{data.inspect}"
puts "LIS: #{result.inspect}"
puts "length: #{result.length}"
puts "increasing: #{result.each_cons(2).all? { |a, b| a < b }}"

puts "all-equal: #{lis([5, 5, 5]).inspect}"
puts "descending: #{lis([5, 4, 3, 2]).inspect}"
puts "already sorted: #{lis([1, 2, 3, 4]).inspect}"
p lis([]).inspect
p lis([3, 1, 2, 1, 5]).length
