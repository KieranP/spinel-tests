# frozen_string_literal: true
# Breadth-first search over an adjacency Hash{Symbol=>Array(Symbol)}.
# Inference: the frontier queue, the visited Set, and the parent map all carry
# Symbol elements that must stay consistent across the traversal.

require "set"

GRAPH = {
  a: [:b, :c],
  b: [:a, :d, :e],
  c: [:a, :f],
  d: [:b],
  e: [:b, :f],
  f: [:c, :e],
}

def shortest_path(graph, start, goal)
  queue = [start]
  visited = Set[start]
  parent = {}
  until queue.empty?
    node = queue.shift
    break if node == goal
    graph[node].each do |nbr|
      next if visited.include?(nbr)
      visited.add(nbr)
      parent[nbr] = node
      queue << nbr
    end
  end

  path = [goal]
  path.unshift(parent[path.first]) while parent.key?(path.first)
  path
end

p shortest_path(GRAPH, :a, :f)
p shortest_path(GRAPH, :d, :c)
p shortest_path(GRAPH, :a, :a)
