# frozen_string_literal: true
# Directed graph: adjacency via Hash of arrays, DFS all-paths, BFS distances.
graph = {
  "A" => ["B", "C"],
  "B" => ["D"],
  "C" => ["D", "E"],
  "D" => ["F"],
  "E" => ["F"],
  "F" => [],
}

def all_paths(graph, start, goal, path = [])
  path = path + [start]
  return [path] if start == goal
  result = []
  graph[start].each do |nxt|
    next if path.include?(nxt)
    all_paths(graph, nxt, goal, path).each { |p| result << p }
  end
  result
end

paths = all_paths(graph, "A", "F")
paths.each { |p| puts p.join(" -> ") }
puts "path count: #{paths.length}"
puts "shortest: #{paths.min_by(&:length).join("-")}"

# BFS distances
dist = { "A" => 0 }
queue = ["A"]
until queue.empty?
  node = queue.shift
  graph[node].each do |n|
    unless dist.key?(n)
      dist[n] = dist[node] + 1
      queue << n
    end
  end
end
dist.sort.each { |k, v| puts "#{k}: #{v}" }
