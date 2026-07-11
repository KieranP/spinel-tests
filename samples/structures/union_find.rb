# frozen_string_literal: true
# Disjoint-set (union-find) with path compression and union by rank.
# Inference: parent/rank Arrays of Integer mutated in place across recursive
# find; connected-component counting folds over the structure.

class UnionFind
  def initialize(n)
    @parent = Array.new(n) { |i| i }
    @rank = Array.new(n, 0)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def union(a, b)
    ra = find(a)
    rb = find(b)
    return false if ra == rb
    if @rank[ra] < @rank[rb]
      @parent[ra] = rb
    elsif @rank[ra] > @rank[rb]
      @parent[rb] = ra
    else
      @parent[rb] = ra
      @rank[ra] += 1
    end
    true
  end

  def components
    (0...@parent.length).group_by { |x| find(x) }
  end
end

uf = UnionFind.new(10)
edges = [[0, 1], [1, 2], [3, 4], [5, 6], [6, 7], [7, 5], [8, 9]]
merged = edges.count { |a, b| uf.union(a, b) }

puts "merges: #{merged}"
comps = uf.components
puts "component count: #{comps.size}"
comps.keys.sort.each do |root|
  puts "#{root}: #{comps[root].sort.inspect}"
end
p uf.find(2) == uf.find(0)
p uf.find(5) == uf.find(9)
