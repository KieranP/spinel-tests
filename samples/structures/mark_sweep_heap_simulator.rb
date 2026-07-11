# frozen_string_literal: true
# A simulated heap with a tri-colour mark-and-sweep collector: objects hold typed
# slots pointing at other objects, roots come and go as a mutator runs a scripted
# sequence, and each collection reports what survived, what was freed and how the
# free list fragments.
# Inference: a heap of Cell objects whose @slots is Hash{Symbol=>Integer} of ids,
# a worklist that mutates while iterating, and a Set of reachable ids threaded
# through a fixpoint that must not lose its element type across the frontier swap.

require "set"

class Cell
  attr_reader :id, :kind, :slots
  attr_accessor :colour

  def initialize(id, kind)
    @id = id
    @kind = kind
    @slots = {}
    @colour = :white
  end

  def point(name, target_id)
    @slots[name] = target_id
    self
  end

  def unpoint(name) = @slots.delete(name)

  def to_s
    refs = @slots.map { |name, target| "#{name}->##{target}" }.join(" ")
    "##{@id} #{@kind}#{refs.empty? ? "" : " [#{refs}]"}"
  end
end

class Heap
  attr_reader :cells, :roots, :log

  def initialize
    @cells = {}
    @roots = Set.new
    @next_id = 0
    @free = []
    @log = []
  end

  def allocate(kind)
    id = @free.empty? ? (@next_id += 1) : @free.shift
    @cells[id] = Cell.new(id, kind)
    id
  end

  def cell(id) = @cells.fetch(id)
  def live_ids = @cells.keys.sort
  def free_list = @free.dup

  def root!(id)
    @roots << id
    id
  end

  def unroot!(id) = @roots.delete(id)

  def link(from, name, to)
    cell(from).point(name, to)
    to
  end

  def unlink(from, name) = cell(from).unpoint(name)

  def reachable
    grey = @roots.select { |id| @cells.key?(id) }
    black = Set.new
    until grey.empty?
      id = grey.pop
      next if black.include?(id)

      black << id
      @cells[id].colour = :black
      cell(id).slots.each_value do |target|
        next if black.include?(target) || !@cells.key?(target)

        @cells[target].colour = :grey
        grey << target
      end
    end
    black
  end

  def collect
    before = @cells.size
    @cells.each_value { |c| c.colour = :white }
    survivors = reachable
    garbage = @cells.keys.reject { |id| survivors.include?(id) }.sort
    garbage.each do |id|
      @cells.delete(id)
      @free << id
    end
    @free.sort!
    entry = { before: before, after: @cells.size, freed: garbage }
    @log << entry
    entry
  end

  def dump
    live_ids.map { |id| cell(id).to_s }
  end
end

heap = Heap.new

puts "== build an object graph =="
env    = heap.root!(heap.allocate(:env))
list   = heap.allocate(:list)
node_a = heap.allocate(:node)
node_b = heap.allocate(:node)
node_c = heap.allocate(:node)
str    = heap.allocate(:string)
orphan = heap.allocate(:node)

heap.link(env, :list, list)
heap.link(list, :head, node_a)
heap.link(node_a, :next, node_b)
heap.link(node_b, :next, node_c)
heap.link(node_c, :value, str)
heap.link(orphan, :value, str)

heap.dump.each { |line| puts "  #{line}" }
puts "roots: #{heap.roots.to_a.sort.inspect}"
puts "reachable: #{heap.reachable.to_a.sort.inspect}"

puts
puts "== first collection drops the orphan =="
p heap.collect
puts "live: #{heap.live_ids.inspect}  free list: #{heap.free_list.inspect}"

puts
puts "== a cycle stays alive while rooted, dies when unlinked =="
cyc1 = heap.allocate(:node)
cyc2 = heap.allocate(:node)
heap.link(cyc1, :peer, cyc2)
heap.link(cyc2, :peer, cyc1)
heap.link(env, :cycle, cyc1)
puts "reachable with cycle rooted: #{heap.reachable.to_a.sort.inspect}"
p heap.collect

heap.unlink(env, :cycle)
puts "after unlinking the cycle:"
p heap.collect
puts "live: #{heap.live_ids.inspect}  free list: #{heap.free_list.inspect}"

puts
puts "== reallocation reuses freed ids =="
reused = 3.times.map { heap.allocate(:fresh) }
puts "ids handed out: #{reused.inspect}"
puts "free list now: #{heap.free_list.inspect}"

puts
puts "== dropping the last root collects everything =="
heap.unroot!(env)
p heap.collect
puts "live: #{heap.live_ids.inspect}"

puts
puts "== collection log =="
heap.log.each_with_index do |entry, i|
  puts format("gc %d: %2d -> %2d live, freed %s",
              i + 1, entry[:before], entry[:after], entry[:freed].inspect)
end
total_freed = heap.log.sum { |e| e[:freed].size }
puts "total objects freed: #{total_freed}"
puts "every log entry shrank or held the heap: #{heap.log.all? { |e| e[:after] <= e[:before] }}"
