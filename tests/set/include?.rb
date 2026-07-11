# frozen_string_literal: true
require 'set'

# Set#include?
p(Set[1, 2, 3].include?(2))
a005 = Set[1, 2, 3]; p(a005.include?(2))
a006 = Set[1, 2, 3]; b006 = 2; c006 = (a006.include?(b006)); p c006

# Set#include? inside a whole BFS program (only reproduced as the full program)
GRAPH870 = { a: [:b, :c], b: [:a, :d, :e], c: [:a, :f], d: [:b], e: [:b, :f], f: [:c, :e] }
def bfs870(graph870, start870, goal870)
  queue870 = [start870]; visited870 = Set[start870]; parent870 = {}
  until queue870.empty?
    node870 = queue870.shift
    break if node870 == goal870
    graph870[node870].each do |nbr870|
      next if visited870.include?(nbr870)
      visited870.add(nbr870); parent870[nbr870] = node870; queue870 << nbr870
    end
  end
  path870 = [goal870]
  path870.unshift(parent870[path870.first]) while parent870.key?(path870.first)
  path870
end
p bfs870(GRAPH870, :a, :f)
p bfs870(GRAPH870, :d, :c)
p bfs870(GRAPH870, :a, :a)

# Set#include? honours a user class's #hash/#eql?
class PtSet196
  attr_reader :x
  def initialize(x); @x = x; end
  def hash = x.hash
  def eql?(o) = o.is_a?(PtSet196) && x == o.x
end
s196 = Set.new; s196 << PtSet196.new(3)
p s196.include?(PtSet196.new(3))
v196 = s196.include?(PtSet196.new(3)); p v196

# Array, Hash, Struct, nested-Set and user-object elements
p(Set[[1, 2], [3]].include?([1, 2]))
a099 = Set[[1, 2]]; v099 = a099.include?([1, 2]); p v099
p(Set[{ a: 1 }].include?({ a: 1 }))
S099 = Struct.new(:x, :y); b099 = Set[S099.new(1, 2)]; p(b099.include?(S099.new(1, 2)))
c099 = Set[Set[1, 2]]; v100 = c099.include?(Set[2, 1]); p v100

# Float and Integer keys are distinct
d099 = Set[1]; p(d099.include?(1.0))
e099 = Set[1.0]; v101 = e099.include?(1); p v101
