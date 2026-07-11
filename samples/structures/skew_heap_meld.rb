# frozen_string_literal: true
# A persistent skew heap: the only primitive is `meld`, which merges two heaps by
# recursing down their right spines and swapping children on the way back up. Insert,
# pop and heap-building all reduce to meld, so every operation returns a fresh heap and
# the old one stays usable.
# Inference: a recursive user type whose fields are the same type or nil, a class method
# that folds an Array into one heap, and comparison driven by a caller-supplied lambda
# so the element type is only pinned at the call site.

class SkewHeap
  include Enumerable

  EMPTY_MARKER = :empty

  attr_reader :value, :left, :right, :size

  def self.empty(&comparator) = new(nil, nil, nil, 0, comparator || ->(a, b) { a <=> b })

  def self.from(items, &comparator)
    items.reduce(empty(&comparator)) { |heap, item| heap.push(item) }
  end

  def initialize(value, left, right, size, comparator)
    @value = value
    @left = left
    @right = right
    @size = size
    @comparator = comparator
  end

  def empty? = @size.zero?

  def push(item) = meld(SkewHeap.new(item, nil, nil, 1, @comparator))

  def peek = empty? ? nil : @value

  def pop
    raise IndexError, "pop from an empty heap" if empty?

    kids = [@left, @right].compact
    rest = kids.reduce(SkewHeap.empty(&@comparator)) { |acc, kid| acc.meld(kid) }
    [@value, rest]
  end

  def meld(other)
    return other if empty?
    return self if other.empty?

    if @comparator.call(@value, other.value) <= 0
      merged = (@right || SkewHeap.empty(&@comparator)).meld(other)
      SkewHeap.new(@value, merged, @left, @size + other.size, @comparator)
    else
      other.meld(self)
    end
  end

  def each
    return to_enum(:each) unless block_given?

    heap = self
    until heap.empty?
      item, heap = heap.pop
      yield item
    end
    self
  end

  def drain = each.to_a

  def height
    return 0 if empty?

    1 + [@left&.height || 0, @right&.height || 0].max
  end

  def shape
    return EMPTY_MARKER if empty?

    [@value, @left.nil? || @left.empty? ? nil : @left.shape, @right.nil? || @right.empty? ? nil : @right.shape]
  end

  def to_s = "SkewHeap(size=#{@size}, top=#{peek.inspect})"
end

puts "== building a heap one push at a time =="
INPUT = [23, 4, 17, 8, 42, 15, 4, 99, 1, 30, 11].freeze
heaps = [SkewHeap.empty]
INPUT.each { |n| heaps << heaps.last.push(n) }
top = heaps.last
puts "input:  #{INPUT.inspect}"
puts "heap:   #{top}"
puts "height: #{top.height} for #{top.size} elements"
puts "drained: #{top.drain.inspect}"
puts "sorted?: #{top.drain == INPUT.sort}"

puts
puts "== every intermediate heap survived =="
mins = heaps.map { |h| h.peek.inspect }
puts "running minima: #{mins.join(' ')}"
puts "sizes:          #{heaps.map(&:size).inspect}"
puts "each prefix drains sorted: #{heaps.each_with_index.all? { |h, i| h.drain == INPUT.first(i).sort }}"

puts
puts "== pop returns a pair, leaving the source intact =="
value, rest = top.pop
puts "popped #{value}, rest has #{rest.size}, source still has #{top.size}"
three = []
cursor = top
3.times do
  v, cursor = cursor.pop
  three << v
end
puts "three smallest: #{three.inspect}, source unchanged: #{top.size == INPUT.size}"

puts
puts "== meld two independently built heaps =="
odds = SkewHeap.from(INPUT.select(&:odd?))
evens = SkewHeap.from(INPUT.select(&:even?))
both = odds.meld(evens)
puts "odds:  #{odds.drain.inspect}"
puts "evens: #{evens.drain.inspect}"
puts "melded: #{both.drain.inspect}"
puts "melding is order-insensitive: #{evens.meld(odds).drain == both.drain}"
puts "sources untouched: #{odds.size == 6 && evens.size == 5}"

puts
puts "== a custom comparator flips the order =="
desc = SkewHeap.from(INPUT) { |a, b| b <=> a }
puts "max-heap top: #{desc.peek}"
puts "drained:      #{desc.drain.inspect}"

by_length = SkewHeap.from(%w[pear fig banana kiwi apple plum cherry]) do |a, b|
  [a.length, a] <=> [b.length, b]
end
puts "by length then alphabet: #{by_length.drain.inspect}"

puts
puts "== heap of user structs =="
Task = Struct.new(:name, :priority, :cost) do
  def to_s = "#{name}(p#{priority}/$#{cost})"
end
tasks = [
  Task.new("deploy", 2, 30), Task.new("triage", 1, 5), Task.new("review", 1, 12),
  Task.new("refactor", 3, 40), Task.new("hotfix", 0, 8)
]
queue = SkewHeap.from(tasks) { |a, b| [a.priority, a.cost] <=> [b.priority, b.cost] }
puts "order: #{queue.drain.map(&:to_s).join(' -> ')}"
puts "top is the hotfix: #{queue.peek.name == 'hotfix'}"

puts
puts "== Enumerable over the heap =="
h = SkewHeap.from(INPUT)
puts "first(4):   #{h.first(4).inspect}"
puts "min/max:    #{[h.min, h.max].inspect}"
puts "take_while: #{h.take_while { |n| n < 20 }.inspect}"
puts "chunk_while runs: #{h.chunk_while { |a, b| b - a <= 4 }.to_a.inspect}"
puts "each_cons(2) diffs: #{h.each_cons(2).map { |a, b| b - a }.inspect}"
puts "tally of duplicates: #{h.tally.select { |_k, v| v > 1 }.inspect}"
puts "group_by parity: #{h.group_by(&:even?).transform_values(&:size).inspect}"

puts
puts "== heapsort by repeated meld of singletons =="
singles = INPUT.map { |n| SkewHeap.empty.push(n) }
merged = singles.reduce { |a, b| a.meld(b) }
puts "pairwise meld sorts: #{merged.drain == INPUT.sort}"
puts "shape of a 5-element heap: #{SkewHeap.from([5, 3, 8, 1, 9]).shape.inspect}"

puts
puts "== empty heap behaviour =="
e = SkewHeap.empty
puts "empty?: #{e.empty?}, size #{e.size}, peek #{e.peek.inspect}, height #{e.height}"
puts "drain:  #{e.drain.inspect}, shape #{e.shape.inspect}"
puts "meld with a real heap gives it back: #{e.meld(h).drain == h.drain}"
puts "pop raises: #{(e.pop rescue "#{$!.class}: #{$!.message}")}"
