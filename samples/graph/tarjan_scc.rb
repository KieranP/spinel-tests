# frozen_string_literal: true
# Tarjan's strongly-connected-components algorithm over a module dependency
# graph, followed by a condensation DAG and a topological build order.
# Inference: an explicit stack of frames replaces recursion; index/lowlink live in
# Hash{String=>Integer} while the component list is Array(Array(String)).

GRAPH = {
  "app"     => ["web", "cli"],
  "web"     => ["core", "views"],
  "cli"     => ["core"],
  "views"   => ["core", "helpers"],
  "helpers" => ["views"],
  "core"    => ["util", "log"],
  "util"    => ["log"],
  "log"     => ["util"],
  "orphan"  => []
}.freeze

class Tarjan
  def initialize(graph)
    @graph = graph
    @index = {}
    @lowlink = {}
    @on_stack = {}
    @stack = []
    @counter = 0
    @components = []
  end

  attr_reader :components

  def run
    @graph.keys.sort.each { |node| visit(node) unless @index.key?(node) }
    @components
  end

  def visit(root)
    work = [[root, 0]]
    @index[root] = @counter
    @lowlink[root] = @counter
    @counter += 1
    @stack << root
    @on_stack[root] = true

    until work.empty?
      node, edge_i = work.last
      neighbours = @graph[node] || []
      if edge_i < neighbours.length
        work[-1] = [node, edge_i + 1]
        child = neighbours[edge_i]
        if !@index.key?(child)
          @index[child] = @counter
          @lowlink[child] = @counter
          @counter += 1
          @stack << child
          @on_stack[child] = true
          work << [child, 0]
        elsif @on_stack[child]
          @lowlink[node] = [@lowlink[node], @index[child]].min
        end
      else
        work.pop
        if @lowlink[node] == @index[node]
          component = []
          loop do
            popped = @stack.pop
            @on_stack.delete(popped)
            component << popped
            break if popped == node
          end
          @components << component.sort
        end
        parent = work.last
        @lowlink[parent[0]] = [@lowlink[parent[0]], @lowlink[node]].min if parent
      end
    end
  end
end

sccs = Tarjan.new(GRAPH).run
p sccs.length
sccs.each { |comp| puts comp.join(" + ") }

p sccs.select { |c| c.length > 1 }.map(&:first)
p sccs.map(&:length).tally.sort.to_h
p sccs.flatten.sort == GRAPH.keys.sort

owner = {}
sccs.each_with_index { |comp, i| comp.each { |node| owner[node] = i } }

condensed = {}
sccs.each_index { |i| condensed[i] = [] }
GRAPH.each do |node, edges|
  edges.each do |dep|
    a = owner[node]
    b = owner[dep]
    condensed[a] << b if a != b && !condensed[a].include?(b)
  end
end
p condensed.map { |k, v| [k, v.sort] }.to_h

indeg = {}
condensed.each_key { |k| indeg[k] = 0 }
condensed.each_value { |vs| vs.each { |v| indeg[v] += 1 } }

order = []
ready = indeg.select { |_, d| d.zero? }.keys.sort
until ready.empty?
  node = ready.shift
  order << node
  condensed[node].sort.each do |dep|
    indeg[dep] -= 1
    ready << dep if indeg[dep].zero?
  end
  ready.sort!
end

p order
p order.length == sccs.length
puts order.map { |i| sccs[i].join("/") }.join(" -> ")

# Every condensation edge must run from an earlier group to a later one.
pos = {}
order.each_with_index { |group, i| pos[group] = i }
p condensed.all? { |from, tos| tos.all? { |to| pos[from] < pos[to] } }
