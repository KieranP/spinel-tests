# frozen_string_literal: true
# A* over a weighted terrain grid with a binary-heap open set, compared against
# uniform-cost search on the same map so the heuristic's admissibility is checked
# rather than asserted: both must return the same optimal cost for every goal.
# Inference: the heap stores [Float, Integer, [Integer, Integer]] triples ordered
# by a Comparable wrapper, came_from is Hash{[Integer,Integer]=>[Integer,Integer]}
# keyed by Arrays, and the cost type must stay Float across g/h/f arithmetic.

TERRAIN = [
  "..........",
  ".~~~~~~~~.",
  ".~..###..~",
  ".~.#...#.~",
  ".~.#.@.#.~",
  ".~.#...#.~",
  ".~..###..~",
  ".~~~~~~~~.",
  "..........",
  ".........."
].freeze

COST = { "." => 1.0, "~" => 3.5, "@" => 1.0 }.freeze
ROWS = TERRAIN.size
COLS = TERRAIN.first.size

class OpenSet
  Entry = Struct.new(:priority, :seq, :cell) do
    include Comparable
    def <=>(other) = [priority, seq] <=> [other.priority, other.seq]
  end

  def initialize
    @heap = []
    @seq = 0
  end

  def empty? = @heap.empty?
  def size = @heap.size

  def push(priority, cell)
    @seq += 1
    @heap << Entry.new(priority, @seq, cell)
    sift_up(@heap.size - 1)
    self
  end

  def pop
    return nil if @heap.empty?

    top = @heap.first
    last = @heap.pop
    unless @heap.empty?
      @heap[0] = last
      sift_down(0)
    end
    top.cell
  end

  private

  def sift_up(i)
    while i.positive?
      parent = (i - 1) / 2
      break if @heap[parent] <= @heap[i]

      @heap[parent], @heap[i] = @heap[i], @heap[parent]
      i = parent
    end
  end

  def sift_down(i)
    loop do
      left = 2 * i + 1
      right = left + 1
      smallest = i
      smallest = left if left < @heap.size && @heap[left] < @heap[smallest]
      smallest = right if right < @heap.size && @heap[right] < @heap[smallest]
      break if smallest == i

      @heap[smallest], @heap[i] = @heap[i], @heap[smallest]
      i = smallest
    end
  end
end

def tile(cell) = TERRAIN[cell[0]][cell[1]]
def blocked?(cell) = tile(cell) == "#"

def neighbours(cell)
  r, c = cell
  [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]]
    .select { |rr, cc| rr.between?(0, ROWS - 1) && cc.between?(0, COLS - 1) }
    .reject { |n| blocked?(n) }
end

def manhattan(a, b)
  ((a[0] - b[0]).abs + (a[1] - b[1]).abs).to_f
end

def search(start, goal, heuristic)
  open = OpenSet.new
  open.push(heuristic.call(start, goal), start)
  came_from = {}
  g = { start => 0.0 }
  expanded = 0
  closed = {}

  until open.empty?
    current = open.pop
    next if closed[current]

    closed[current] = true
    expanded += 1
    break if current == goal

    neighbours(current).each do |nb|
      tentative = g[current] + COST.fetch(tile(nb))
      known = g[nb]
      next unless known.nil? || tentative < known

      g[nb] = tentative
      came_from[nb] = current
      open.push(tentative + heuristic.call(nb, goal), nb)
    end
  end

  return [nil, Float::INFINITY, expanded] unless g.key?(goal)

  path = [goal]
  path.unshift(came_from[path.first]) while came_from.key?(path.first)
  [path, g[goal], expanded]
end

ASTAR = ->(a, b) { manhattan(a, b) }
DIJKSTRA = ->(_a, _b) { 0.0 }

START = [0, 0].freeze
CENTRE = [4, 5].freeze
CORNER = [9, 9].freeze
MOAT = [4, 1].freeze

puts "== the map =="
TERRAIN.each_with_index { |row, i| puts format("%d %s", i, row) }
puts "passable tiles: #{(0...ROWS).sum { |r| (0...COLS).count { |c| !blocked?([r, c]) } }} of #{ROWS * COLS}"

puts
puts "== A* vs uniform cost =="
[CENTRE, CORNER, MOAT].each do |goal|
  a_path, a_cost, a_expanded = search(START, goal, ASTAR)
  d_path, d_cost, d_expanded = search(START, goal, DIJKSTRA)
  reachable = !a_path.nil?
  puts format("goal %-7s reachable=%-5s cost=%-6s same-as-dijkstra=%s  expanded %d vs %d",
              goal.inspect, reachable,
              reachable ? a_cost.round(2) : "inf",
              a_cost == d_cost, a_expanded, d_expanded)
  next unless reachable

  puts "  path length: #{a_path.size} steps, dijkstra found #{d_path.size}"
end

puts
puts "== the walled centre is unreachable =="
path, cost, expanded = search(START, CENTRE, ASTAR)
puts "path: #{path.inspect}  cost: #{cost}  expanded: #{expanded}"

puts
puts "== route to the far corner =="
path, cost, = search(START, CORNER, ASTAR)
overlay = TERRAIN.map(&:dup)
path.each { |r, c| overlay[r][c] = "*" }
overlay.each { |row| puts "  #{row}" }
puts "cost #{cost.round(2)} over #{path.size - 1} moves"

tiles = path.map { |cell| tile(cell) }.tally.sort
puts "tiles walked: #{tiles.inspect}"
puts "swamp avoided where possible: #{path.count { |cell| tile(cell) == "~" }} swamp cells"

puts
puts "== every step is adjacent and passable =="
steps_ok = path.each_cons(2).all? { |a, b| manhattan(a, b) == 1.0 }
puts "contiguous: #{steps_ok}"
puts "all passable: #{path.none? { |cell| blocked?(cell) }}"
recomputed = path.drop(1).sum { |cell| COST.fetch(tile(cell)) }
puts "recomputed cost matches: #{(recomputed - cost).abs < 1e-9}"

puts
puts "== heap sanity =="
heap = OpenSet.new
[5.0, 1.0, 4.0, 1.0, 3.0, 2.0].each_with_index { |pri, i| heap.push(pri, [i, i]) }
drained = []
drained << heap.pop until heap.empty?
puts "drained in priority order: #{drained.inspect}"
puts "empty after drain: #{heap.empty?} (size #{heap.size})"
