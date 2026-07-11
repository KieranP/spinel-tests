# frozen_string_literal: true
# Array-backed binary min-heap: push, pop, heapsort.
# Inference: an Array(Integer) mutated in place by sift-up / sift-down index
# arithmetic; the drained sequence must stay Integer-typed.

class MinHeap
  def initialize
    @data = []
  end

  def push(v)
    @data << v
    i = @data.length - 1
    while i > 0
      parent = (i - 1) / 2
      break if @data[parent] <= @data[i]
      @data[i], @data[parent] = @data[parent], @data[i]
      i = parent
    end
    self
  end

  def pop
    return nil if @data.empty?
    top = @data[0]
    last = @data.pop
    unless @data.empty?
      @data[0] = last
      sift_down(0)
    end
    top
  end

  def sift_down(i)
    n = @data.length
    loop do
      l = 2 * i + 1
      r = 2 * i + 2
      smallest = i
      smallest = l if l < n && @data[l] < @data[smallest]
      smallest = r if r < n && @data[r] < @data[smallest]
      break if smallest == i
      @data[i], @data[smallest] = @data[smallest], @data[i]
      i = smallest
    end
  end

  def empty? = @data.empty?
end

heap = MinHeap.new
[5, 3, 8, 1, 9, 2, 7].each { |n| heap.push(n) }

sorted = []
sorted << heap.pop until heap.empty?

p sorted
p sorted == sorted.sort
