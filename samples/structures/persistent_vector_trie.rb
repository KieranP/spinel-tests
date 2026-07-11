# frozen_string_literal: true
# A persistent (immutable) vector as a bit-partitioned trie of branching factor 32:
# every push/update returns a new vector that shares all untouched nodes with the old
# one, so old versions stay valid. The run keeps a history of versions and re-reads
# each after later writes to prove nothing was mutated behind their backs.
# Inference: a recursive node type that is either an Array of child nodes or an Array
# of leaf values, path-copying that rebuilds only the spine, and a version history
# Array whose element type is the user Vector class.

BITS = 5
WIDTH = 1 << BITS
MASK = WIDTH - 1

class PVector
  include Enumerable

  attr_reader :size, :shift

  def self.empty = new(0, 0, [])

  def initialize(size, shift, root)
    @size = size
    @shift = shift
    @root = root
  end

  def empty? = @size.zero?

  def at(index)
    raise IndexError, "index #{index} out of range 0...#{@size}" unless index.between?(0, @size - 1)

    node = @root
    level = @shift
    while level.positive?
      node = node[(index >> level) & MASK]
      level -= BITS
    end
    node[index & MASK]
  end

  def [](index) = index.negative? ? at(@size + index) : at(index)

  def push(value)
    if @size < (1 << (@shift + BITS))
      PVector.new(@size + 1, @shift, assoc_path(@root, @shift, @size, value))
    else
      new_shift = @shift + BITS
      new_root = [@root, new_path(@shift, @size, value)]
      PVector.new(@size + 1, new_shift, new_root)
    end
  end

  def update(index, value)
    raise IndexError, "index #{index} out of range 0...#{@size}" unless index.between?(0, @size - 1)

    PVector.new(@size, @shift, assoc_path(@root, @shift, index, value))
  end

  def pop
    raise IndexError, "pop from an empty vector" if empty?

    PVector.new(@size - 1, @shift, @root)
  end

  def each
    return to_enum(:each) unless block_given?

    (0...@size).each { |i| yield at(i) }
    self
  end

  def to_a = each.to_a
  def last = empty? ? nil : at(@size - 1)
  def to_s = "PVector(#{to_a.inspect})"

  def ==(other) = other.is_a?(PVector) && to_a == other.to_a

  # How many trie nodes this vector's structure occupies, counting shared nodes once.
  def node_ids(seen = {})
    walk(@root, @shift, seen)
    seen
  end

  protected

  attr_reader :root

  private

  def assoc_path(node, level, index, value)
    copy = node.dup
    if level.zero?
      copy[index & MASK] = value
    else
      slot = (index >> level) & MASK
      child = node[slot]
      copy[slot] = child.nil? ? new_path(level - BITS, index, value) : assoc_path(child, level - BITS, index, value)
    end
    copy
  end

  def new_path(level, index, value)
    node = []
    if level.zero?
      node[index & MASK] = value
    else
      node[(index >> level) & MASK] = new_path(level - BITS, index, value)
    end
    node
  end

  def walk(node, level, seen)
    seen[node.object_id] = level
    return if level.zero?

    node.each { |child| walk(child, level - BITS, seen) if child.is_a?(Array) }
  end
end

puts "== building a vector by repeated push =="
versions = [PVector.empty]
40.times { |i| versions << versions.last.push(i * i) }
current = versions.last
puts "size: #{current.size}, shift: #{current.shift}"
puts "first 8: #{current.to_a.first(8).inspect}"
puts "last 3: #{current.to_a.last(3).inspect}"
puts "at(0)=#{current.at(0)} at(31)=#{current.at(31)} at(39)=#{current.at(39)}"
puts "negative index [-1]: #{current[-1]}, [-40]: #{current[-40]}"

puts
puts "== every historical version is intact =="
sizes = versions.map(&:size)
puts "sizes are 0..40 in order: #{sizes == (0..40).to_a}"
mismatched = versions.each_with_index.reject do |v, i|
  v.to_a == (0...i).map { |n| n * n }
end
puts "every version still reads its own contents: #{mismatched.empty?}"
puts "version 5:  #{versions[5]}"
puts "version 33 first 4: #{versions[33].to_a.first(4).inspect}"

puts
puts "== update returns a new vector, leaving the old alone =="
before = versions[10]
after = before.update(3, :changed)
puts "before: #{before}"
puts "after:  #{after}"
puts "sizes equal: #{before.size == after.size}"
puts "old index 3 unchanged: #{before.at(3).inspect}"
puts "new index 3 changed:   #{after.at(3).inspect}"
puts "all other slots identical: #{(0...before.size).reject { |i| i == 3 }.all? { |i| before.at(i) == after.at(i) }}"

puts
puts "== structural sharing =="
big = versions[39]
tweaked = big.update(0, :zero)
shared = big.node_ids.keys & tweaked.node_ids.keys
puts "nodes in the original:   #{big.node_ids.size}"
puts "nodes in the updated:    #{tweaked.node_ids.size}"
puts "nodes shared between them: #{shared.size}"
puts "the update copied only the spine: #{big.node_ids.size - shared.size <= big.shift / BITS + 1}"

puts
puts "== Enumerable comes for free =="
v = versions[12]
puts "to_a:      #{v.to_a.inspect}"
puts "map:       #{v.map { |n| n + 1 }.inspect}"
puts "select:    #{v.select(&:even?).inspect}"
puts "sum:       #{v.sum}"
puts "max/min:   #{[v.max, v.min].inspect}"
puts "each_slice: #{v.each_slice(5).to_a.inspect}"
puts "include? 49: #{v.include?(49)}, include? 50: #{v.include?(50)}"
puts "sort_by desc: #{v.sort_by { |n| -n }.first(4).inspect}"
puts "external enum: #{v.each.take(3).inspect}"

puts
puts "== equality and pop =="
puts "v == rebuilt: #{v == (0...12).reduce(PVector.empty) { |acc, i| acc.push(i * i) }}"
puts "v == versions[13]: #{v == versions[13]}"
popped = v.pop
puts "pop shrinks: #{popped.size} from #{v.size}, last now #{popped.last}"
puts "the popped-from vector is unchanged: #{v.size == 12 && v.last == 121}"

puts
puts "== error paths =="
[["at(100)", -> { current.at(100) }],
 ["at(-1)", -> { current.at(-1) }],
 ["update(100, :x)", -> { current.update(100, :x) }],
 ["empty.pop", -> { PVector.empty.pop }]].each do |label, thunk|
  result = (thunk.call.to_s rescue "#{$!.class}: #{$!.message}")
  puts format("  %-16s -> %s", label, result)
end
