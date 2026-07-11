# frozen_string_literal: true
# Adjacency-list graph: BFS distances and degree tallies.
edges = [[1, 2], [1, 3], [2, 4], [3, 4], [4, 5]]

adj = Hash.new { |h, k| h[k] = [] }
edges.each do |u, v|
  adj[u] << v
  adj[v] << u
end

# BFS from node 1
dist = { 1 => 0 }
queue = [1]
until queue.empty?
  node = queue.shift
  adj[node].sort.each do |nbr|
    next if dist.key?(nbr)
    dist[nbr] = dist[node] + 1
    queue << nbr
  end
end

dist.sort_by { |k, _| k }.each do |node, d|
  puts "node #{node}: dist #{d}"
end

# degree of each node
degree = adj.transform_values(&:size)
p degree.sort_by { |k, _| k }

# nodes grouped by degree
by_deg = degree.group_by { |_n, d| d }.transform_values { |pairs| pairs.map(&:first).sort }
p by_deg.sort.to_h
