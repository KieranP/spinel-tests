# frozen_string_literal: true
# Greedy graph coloring, degree computation, adjacency via Hash of Sets.
require 'set'

edges = [[0, 1], [0, 2], [1, 2], [1, 3], [2, 3], [3, 4], [4, 5], [2, 5]]
adj = Hash.new { |h, k| h[k] = Set.new }
edges.each do |u, v|
  adj[u] << v
  adj[v] << u
end

nodes = adj.keys.sort
degrees = nodes.map { |n| [n, adj[n].size] }.to_h
puts "degrees: #{degrees.inspect}"
puts "max degree: #{degrees.values.max}"

# greedy coloring in degree order
order = nodes.sort_by { |n| -adj[n].size }
colors = {}
order.each do |node|
  used = adj[node].map { |nb| colors[nb] }.compact.to_set
  color = 0
  color += 1 while used.include?(color)
  colors[node] = color
end

colors.sort.each { |node, c| puts "node #{node}: color #{c}" }
puts "colors used: #{colors.values.uniq.sort.inspect}"
puts "chromatic estimate: #{colors.values.max + 1}"

# verify no adjacent same color
valid = edges.all? { |u, v| colors[u] != colors[v] }
puts "valid coloring: #{valid}"
