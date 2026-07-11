# frozen_string_literal: true
# Fixed-capacity ring buffer backed by an Array with a modular write index.
# Inference: an Array(Integer) of fixed size mutated by index arithmetic, plus a
# count and head pointer that must stay Integer-typed across wraps.

class RingBuffer
  def initialize(capacity)
    @capacity = capacity
    @data = Array.new(capacity, 0)
    @head = 0
    @count = 0
  end

  def push(value)
    @data[@head] = value
    @head = (@head + 1) % @capacity
    @count += 1 if @count < @capacity
    self
  end

  def to_a
    if @count < @capacity
      @data[0...@count]
    else
      @data[@head..] + @data[0...@head]
    end
  end

  def sum = to_a.sum
end

buf = RingBuffer.new(4)
(1..7).each { |n| buf.push(n) }

p buf.to_a
p buf.sum

buf2 = RingBuffer.new(5)
[10, 20, 30].each { |n| buf2.push(n) }
p buf2.to_a
p buf2.sum
