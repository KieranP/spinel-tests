# frozen_string_literal: true
# Dijkstra shortest paths over a weighted graph.
# Inference: adjacency is Hash{Symbol=>Array([Symbol, Integer])}; the distance
# map is Hash{Symbol=>Integer}; both element types must survive the relaxation.

GRAPH = {
  a: [[:b, 7], [:c, 9], [:f, 14]],
  b: [[:a, 7], [:c, 10], [:d, 15]],
  c: [[:a, 9], [:b, 10], [:d, 11], [:f, 2]],
  d: [[:b, 15], [:c, 11], [:e, 6]],
  e: [[:d, 6], [:f, 9]],
  f: [[:a, 14], [:c, 2], [:e, 9]],
}

def shortest(graph, source)
  dist = {}
  graph.each_key { |node| dist[node] = 1_000_000 }
  dist[source] = 0
  visited = {}

  until visited.size == graph.size
    current = nil
    best = 1_000_001
    dist.each do |node, d|
      next if visited[node]
      if d < best
        best = d
        current = node
      end
    end
    break if current.nil?
    visited[current] = true
    graph[current].each do |neighbour, weight|
      alt = dist[current] + weight
      dist[neighbour] = alt if alt < dist[neighbour]
    end
  end
  dist
end

result = shortest(GRAPH, :a)
result.sort.each { |node, d| puts "#{node}: #{d}" }
