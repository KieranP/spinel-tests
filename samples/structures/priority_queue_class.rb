# frozen_string_literal: true
# A binary-heap priority queue with a Comparable task class.
class Task
  include Comparable
  attr_reader :name, :priority
  def initialize(name, priority)
    @name = name
    @priority = priority
  end
  def <=>(other)
    priority <=> other.priority
  end
  def to_s
    "#{name}(#{priority})"
  end
end

class MinHeap
  def initialize
    @data = []
  end
  def push(item)
    @data << item
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
  def size = @data.size
  def sift_down(i)
    n = @data.length
    loop do
      l, r = 2 * i + 1, 2 * i + 2
      smallest = i
      smallest = l if l < n && @data[l] < @data[smallest]
      smallest = r if r < n && @data[r] < @data[smallest]
      break if smallest == i
      @data[i], @data[smallest] = @data[smallest], @data[i]
      i = smallest
    end
  end
end

h = MinHeap.new
[["low", 5], ["urgent", 1], ["mid", 3], ["also_urgent", 1]].each { |n, p| h.push(Task.new(n, p)) }
order = []
order << h.pop.to_s until h.size == 0
puts "pop order: #{order.join(", ")}"
tasks = [Task.new("a", 3), Task.new("b", 1), Task.new("c", 2)]
puts "sorted: #{tasks.sort.map(&:to_s).join(", ")}"
puts "min: #{tasks.min}"
puts "max: #{tasks.max}"
