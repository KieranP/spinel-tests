# frozen_string_literal: true
# Topological sort of a dependency DAG via recursive DFS.
# Inference: adjacency is Hash{Symbol=>Array(Symbol)}; the visited marks and the
# output order carry Symbols that must stay consistent through the recursion.

DEPS = {
  boot: [:kernel],
  kernel: [:memory, :cpu],
  memory: [],
  cpu: [],
  drivers: [:kernel],
  services: [:drivers, :memory],
  ui: [:services, :drivers],
}

def toposort(graph)
  visited = {}
  order = []
  graph.each_key { |node| visit(node, graph, visited, order) }
  order
end

def visit(node, graph, visited, order)
  return if visited[node]
  visited[node] = true
  graph[node].each { |dep| visit(dep, graph, visited, order) }
  order << node
end

order = toposort(DEPS)
p order

position = {}
order.each_with_index { |node, i| position[node] = i }
ok = DEPS.all? { |node, deps| deps.all? { |d| position[d] < position[node] } }
p ok
p order.length
