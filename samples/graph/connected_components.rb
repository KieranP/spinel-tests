# frozen_string_literal: true
# Connected components of an undirected graph via depth-first search.
# Inference: an adjacency Hash(Integer => Array(Integer)), a visited Set, a stack
# DFS, and component collection sorted for stable output.

require "set"

def build_graph(edges)
  graph = Hash.new { |h, k| h[k] = [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end
  graph
end

def components(graph, nodes)
  visited = Set.new
  result = []
  nodes.each do |start|
    next if visited.include?(start)
    comp = []
    stack = [start]
    until stack.empty?
      node = stack.pop
      next if visited.include?(node)
      visited << node
      comp << node
      graph[node].each { |n| stack << n unless visited.include?(n) }
    end
    result << comp.sort
  end
  result
end

edges = [[1, 2], [2, 3], [4, 5], [6, 7], [7, 8], [8, 6]]
nodes = (1..9).to_a
graph = build_graph(edges)

comps = components(graph, nodes).sort_by(&:first)
puts "component count: #{comps.length}"
comps.each { |c| puts c.inspect }

puts "largest: #{comps.max_by(&:length).inspect}"
puts "singletons: #{comps.count { |c| c.length == 1 }}"

degrees = nodes.map { |n| graph[n].length }
puts "degree sequence: #{degrees.sort.reverse.inspect}"
puts "same component 1 & 3: #{comps.any? { |c| c.include?(1) && c.include?(3) }}"
p components(build_graph([[1, 2]]), [1, 2]).length
p comps.map(&:length).sort
