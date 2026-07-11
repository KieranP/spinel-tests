# frozen_string_literal: true
# Detect cycles in a directed graph via three-color DFS.
# Inference: an adjacency Hash(Symbol => Array(Symbol)), a color Hash tracking
# white/gray/black, and recursive DFS returning a boolean up the call graph.

def has_cycle?(graph, nodes)
  color = {}
  nodes.each { |n| color[n] = :white }

  visit = lambda do |node|
    color[node] = :gray
    graph.fetch(node, []).each do |nbr|
      return true if color[nbr] == :gray
      return true if color[nbr] == :white && visit.call(nbr)
    end
    color[node] = :black
    false
  end

  nodes.any? { |n| color[n] == :white && visit.call(n) }
end

def topo_order(graph, nodes)
  color = {}
  nodes.each { |n| color[n] = :white }
  order = []
  visit = lambda do |node|
    color[node] = :gray
    graph.fetch(node, []).each { |nbr| visit.call(nbr) if color[nbr] == :white }
    color[node] = :black
    order << node
  end
  nodes.each { |n| visit.call(n) if color[n] == :white }
  order.reverse
end

dag = { a: [:b, :c], b: [:d], c: [:d], d: [] }
cyclic = { a: [:b], b: [:c], c: [:a] }
nodes = %i[a b c d]

puts "dag has cycle: #{has_cycle?(dag, nodes)}"
puts "cyclic has cycle: #{has_cycle?(cyclic, %i[a b c])}"
puts "topo order of dag: #{topo_order(dag, nodes).inspect}"

self_loop = { a: [:a] }
puts "self-loop has cycle: #{has_cycle?(self_loop, [:a])}"

# topological order respects edges: each node appears before its successors
order = topo_order(dag, nodes)
valid = dag.all? do |u, vs|
  vs.all? { |v| order.index(u) < order.index(v) }
end
puts "topo valid: #{valid}"
p has_cycle?({ x: [:y], y: [] }, %i[x y])
p topo_order({ p: [:q], q: [:r], r: [] }, %i[p q r])
