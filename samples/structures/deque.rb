# frozen_string_literal: true
# A double-ended queue backed by an Array, driving a sliding-window maximum.
# Inference: Array used as a deque (push/pop/shift/unshift, first/last), storing
# index Integers, with values read back out of the source Array.

class Deque
  def initialize
    @items = []
  end

  def push_back(x) = @items.push(x)
  def push_front(x) = @items.unshift(x)
  def pop_back = @items.pop
  def pop_front = @items.shift
  def front = @items.first
  def back = @items.last
  def empty? = @items.empty?
  def size = @items.length
  def to_a = @items.dup
end

def sliding_max(nums, k)
  dq = Deque.new
  result = []
  nums.each_with_index do |n, i|
    dq.pop_front while !dq.empty? && dq.front <= i - k
    dq.pop_back while !dq.empty? && nums[dq.back] <= n
    dq.push_back(i)
    result << nums[dq.front] if i >= k - 1
  end
  result
end

nums = [1, 3, -1, -3, 5, 3, 6, 7]
puts "sliding max (k=3): #{sliding_max(nums, 3).inspect}"
puts "sliding max (k=1): #{sliding_max(nums, 1).inspect}"

d = Deque.new
d.push_back(1)
d.push_back(2)
d.push_front(0)
puts "deque: #{d.to_a.inspect}"
puts "front/back: #{d.front}/#{d.back}"
puts "pop_front: #{d.pop_front}, pop_back: #{d.pop_back}"
puts "remaining: #{d.to_a.inspect}"
p sliding_max([9, 8, 7, 6], 2)
