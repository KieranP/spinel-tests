# frozen_string_literal: true
# Minimum spanning tree via Kruskal's algorithm with union-find.
# Inference: edges as [weight, u, v] arrays sorted by weight, a parent Array with
# path-compressed find, and a fold accumulating the MST weight.

def find(parent, x)
  parent[x] = find(parent, parent[x]) if parent[x] != x
  parent[x]
end

def union(parent, rank, a, b)
  ra = find(parent, a)
  rb = find(parent, b)
  return false if ra == rb
  if rank[ra] < rank[rb]
    parent[ra] = rb
  elsif rank[ra] > rank[rb]
    parent[rb] = ra
  else
    parent[rb] = ra
    rank[ra] += 1
  end
  true
end

def kruskal(n, edges)
  parent = Array.new(n) { |i| i }
  rank = Array.new(n, 0)
  total = 0
  chosen = []
  edges.sort.each do |w, u, v|
    if union(parent, rank, u, v)
      total += w
      chosen << [u, v, w]
    end
  end
  [total, chosen]
end

edges = [
  [4, 0, 1], [8, 0, 7], [11, 1, 7], [8, 1, 2],
  [7, 2, 3], [1, 2, 8], [2, 7, 8], [6, 8, 6],
  [7, 6, 5], [2, 5, 2], [14, 3, 5], [9, 3, 4], [10, 4, 5],
]

total, chosen = kruskal(9, edges)
puts "MST weight: #{total}"
puts "edges chosen: #{chosen.length}"
chosen.each { |u, v, w| puts "#{u}-#{v} (#{w})" }

puts "tree property (n-1 edges): #{chosen.length == 8}"
puts "max edge in MST: #{chosen.map { |_u, _v, w| w }.max}"

simple = kruskal(3, [[1, 0, 1], [2, 1, 2], [3, 0, 2]])
puts "simple MST weight: #{simple[0]}"
p kruskal(2, [[5, 0, 1]])[0]
p chosen.sum { |_u, _v, w| w }
