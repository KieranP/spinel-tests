# frozen_string_literal: true
# Bellman-Ford over a directed graph with negative edge weights: relax every edge V-1
# times, then use one extra pass to detect a negative cycle and walk the predecessor
# chain to name the cycle itself. Also runs Johnson's reweighting so a graph with
# negative edges can be handed to a non-negative shortest-path routine.
# Inference: a distance Hash that starts as Float::INFINITY and becomes Integer,
# a predecessor Hash of node-or-nil, and a return that is either a path Array or a
# cycle Array depending on what the extra pass finds.

Edge = Struct.new(:from, :to, :weight) do
  def to_s = "#{from}->#{to}(#{weight})"
end

class Digraph
  attr_reader :edges

  def initialize(edges)
    @edges = edges
  end

  def nodes = (@edges.map(&:from) + @edges.map(&:to)).uniq.sort

  def out_of(node) = @edges.select { |e| e.from == node }

  def bellman_ford(source)
    distance = nodes.to_h { |n| [n, Float::INFINITY] }
    predecessor = nodes.to_h { |n| [n, nil] }
    distance[source] = 0

    (nodes.size - 1).times do
      changed = false
      @edges.each do |edge|
        next if distance[edge.from] == Float::INFINITY

        candidate = distance[edge.from] + edge.weight
        next unless candidate < distance[edge.to]

        distance[edge.to] = candidate
        predecessor[edge.to] = edge.from
        changed = true
      end
      break unless changed
    end

    [distance, predecessor]
  end

  # An edge that still relaxes after V-1 passes sits on (or downstream of) a negative
  # cycle; stepping back V times from it lands inside the cycle.
  def negative_cycle(source)
    distance, predecessor = bellman_ford(source)
    culprit = @edges.find do |edge|
      distance[edge.from] != Float::INFINITY && distance[edge.from] + edge.weight < distance[edge.to]
    end
    return nil if culprit.nil?

    node = culprit.to
    nodes.size.times { node = predecessor[node] }
    cycle = [node]
    walker = predecessor[node]
    while walker != node
      cycle << walker
      walker = predecessor[walker]
    end
    cycle << node
    cycle.reverse
  end

  def path(source, target)
    distance, predecessor = bellman_ford(source)
    return nil if distance[target] == Float::INFINITY

    route = [target]
    route.unshift(predecessor[route.first]) while predecessor[route.first]
    [route, distance[target]]
  end

  # Johnson: add a virtual source, use its potentials to make every weight
  # non-negative, then Dijkstra is safe.
  def potentials
    virtual = "__source__"
    augmented = Digraph.new(@edges + nodes.map { |n| Edge.new(virtual, n, 0) })
    augmented.bellman_ford(virtual).first
  end

  def reweighted
    phi = potentials
    @edges.map { |e| Edge.new(e.from, e.to, e.weight + phi[e.from] - phi[e.to]) }
  end

  def dijkstra(source)
    distance = nodes.to_h { |n| [n, Float::INFINITY] }
    distance[source] = 0
    settled = {}
    until settled.size == nodes.size
      current = distance.reject { |n, _d| settled.key?(n) }.min_by { |_n, d| d }
      break if current.nil? || current.last == Float::INFINITY

      node = current.first
      settled[node] = true
      out_of(node).each do |edge|
        candidate = distance[node] + edge.weight
        distance[edge.to] = candidate if candidate < distance[edge.to]
      end
    end
    distance
  end

  def to_s = "Digraph(#{nodes.size} nodes, #{@edges.size} edges)"
end

def show(distance)
  distance.sort.map { |n, d| "#{n}=#{d == Float::INFINITY ? 'inf' : d}" }.join(" ")
end

PLAIN = Digraph.new([
  Edge.new("s", "a", 4), Edge.new("s", "b", 2),
  Edge.new("a", "c", 3), Edge.new("b", "a", -1),
  Edge.new("b", "d", 4), Edge.new("c", "d", -2),
  Edge.new("d", "e", 1), Edge.new("c", "e", 5),
  Edge.new("e", "f", 3)
])

puts "== a graph with negative edges but no negative cycle =="
puts PLAIN.to_s
puts "nodes: #{PLAIN.nodes.inspect}"
puts "edges: #{PLAIN.edges.map(&:to_s).join(' ')}"
distance, predecessor = PLAIN.bellman_ford("s")
puts "distances from s: #{show(distance)}"
puts "predecessors:     #{predecessor.sort.to_h.inspect}"
puts "negative cycle:   #{PLAIN.negative_cycle('s').inspect}"

puts
puts "== shortest paths, read off the predecessor chain =="
%w[a b c d e f].each do |target|
  route, cost = PLAIN.path("s", target)
  puts format("  s -> %-2s cost %-4s via %s", target, cost, route.join("->"))
end
puts "unreachable target: #{PLAIN.path('f', 's').inspect}"

puts
puts "== negative edges really are used =="
negative_edges = PLAIN.edges.select { |e| e.weight.negative? }
puts "negative edges: #{negative_edges.map(&:to_s).join(' ')}"
route_to_d, cost_to_d = PLAIN.path("s", "d")
puts "s->d is #{cost_to_d} through #{route_to_d.join('->')}, not the direct s->b->d #{2 + 4}"
puts "and it beats every all-positive route: #{cost_to_d < 6}"

puts
puts "== Johnson reweighting makes every weight non-negative =="
reweighted = PLAIN.reweighted
puts "reweighted: #{reweighted.map(&:to_s).join(' ')}"
puts "all non-negative: #{reweighted.map(&:weight).none?(&:negative?)}"
phi = PLAIN.potentials
dijkstra_ok = PLAIN.nodes.all? do |source|
  exact = PLAIN.bellman_ford(source).first
  fast = Digraph.new(reweighted).dijkstra(source)
  PLAIN.nodes.all? do |target|
    next true if exact[target] == Float::INFINITY

    fast[target] - phi[source] + phi[target] == exact[target]
  end
end
puts "Dijkstra on the reweighted graph agrees with Bellman-Ford: #{dijkstra_ok}"

puts
puts "== a graph with a negative cycle =="
CYCLIC = Digraph.new([
  Edge.new("s", "a", 1), Edge.new("a", "b", 2),
  Edge.new("b", "c", -6), Edge.new("c", "a", 2),
  Edge.new("b", "d", 3), Edge.new("d", "t", 1)
])
puts CYCLIC.to_s
cycle = CYCLIC.negative_cycle("s")
puts "cycle found: #{cycle.inspect}"
cycle_weight = cycle.each_cons(2).sum do |from, to|
  CYCLIC.edges.find { |e| e.from == from && e.to == to }.weight
end
puts "its total weight is negative: #{cycle_weight} (#{cycle_weight.negative?})"
puts "it starts and ends at the same node: #{cycle.first == cycle.last}"

puts
puts "== a self-loop with negative weight is a cycle of length one =="
LOOP = Digraph.new([Edge.new("s", "a", 1), Edge.new("a", "a", -1), Edge.new("a", "b", 2)])
puts "cycle: #{LOOP.negative_cycle('s').inspect}"
puts "distances stop being meaningful, which is why we check first: " \
     "#{LOOP.negative_cycle('s').nil? ? 'no cycle' : 'cycle present'}"

puts
puts "== early exit when nothing relaxes =="
CHAIN = Digraph.new([Edge.new("a", "b", 1), Edge.new("b", "c", 1), Edge.new("c", "d", 1)])
chain_distance, = CHAIN.bellman_ford("a")
puts "chain distances: #{show(chain_distance)}"
puts "reaching the far end costs the number of hops: #{chain_distance['d'] == 3}"
puts "no cycle: #{CHAIN.negative_cycle('a').inspect}"

puts
puts "== unreachable nodes stay at infinity =="
SPLIT = Digraph.new([Edge.new("a", "b", 1), Edge.new("x", "y", 1)])
split_distance, = SPLIT.bellman_ford("a")
puts "distances: #{show(split_distance)}"
puts "the other component is unreachable: " \
     "#{split_distance['x'] == Float::INFINITY && split_distance['y'] == Float::INFINITY}"
puts "and infinity survives arithmetic checks: #{(split_distance['x'] + 5).infinite?}"

puts
puts "== single node and empty graph =="
puts "one node: #{show(Digraph.new([Edge.new('a', 'a', 3)]).bellman_ford('a').first)}"
probes = [
  ["empty graph nodes", -> { Digraph.new([]).nodes }],
  ["empty graph from a missing source", -> { Digraph.new([]).bellman_ford("a").first }],
  ["path to a node not in the graph", -> { PLAIN.path("s", "zzz") }],
  ["cycle walk on a graph with none", -> { CHAIN.negative_cycle("a").inspect }]
]
probes.each do |label, thunk|
  outcome = (thunk.call.inspect rescue "#{$!.class}")
  puts format("  %-34s -> %s", label, outcome)
end
