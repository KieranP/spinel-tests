# frozen_string_literal: true
# All-pairs shortest paths via Floyd-Warshall over an integer distance matrix.
# Inference: a 2D Array(Integer) with a large sentinel for infinity, an in-place
# triple loop relaxation, and reachability derived from the result.

INF = 1_000_000

def floyd_warshall(dist)
  n = dist.length
  d = dist.map(&:dup)
  (0...n).each do |k|
    (0...n).each do |i|
      (0...n).each do |j|
        via = d[i][k] + d[k][j]
        d[i][j] = via if via < d[i][j]
      end
    end
  end
  d
end

# 4-node directed graph
graph = [
  [0, 3, INF, 7],
  [8, 0, 2, INF],
  [5, INF, 0, 1],
  [2, INF, INF, 0],
]

result = floyd_warshall(graph)
result.each_with_index do |row, i|
  shown = row.map { |v| v >= INF ? "INF" : v.to_s }
  puts "from #{i}: #{shown.inspect}"
end

# longest finite shortest-path (graph diameter)
finite = result.flatten.reject { |v| v >= INF || v == 0 }
puts "diameter: #{finite.max}"
puts "total of all shortest paths: #{finite.sum}"

# is every node reachable from node 0?
reachable = result[0].count { |v| v < INF }
puts "reachable from 0: #{reachable}/#{graph.length}"
puts "shortest 0->2: #{result[0][2]}"
p floyd_warshall([[0, 1], [INF, 0]])[0][1]
p result[3][1] >= INF
