# frozen_string_literal: true
# A zipper over a rose tree: the cursor holds the focused subtree plus a stack of
# "crumbs", each recording the parent's label and the siblings to its left and right.
# Moving up rebuilds the parent from a crumb, so navigation and editing are pure and the
# original tree stays intact.
# Inference: two mutually recursive user types (a tree whose children are trees, a crumb
# holding Arrays of trees), navigation methods that return a zipper or nil, and an edit
# that rebuilds every ancestor on the way back to the root.

class Tree
  attr_reader :label, :children

  def initialize(label, children = [])
    @label = label
    @children = children
  end

  def leaf? = @children.empty?

  def size = 1 + @children.sum(&:size)

  def depth = leaf? ? 1 : 1 + @children.map(&:depth).max

  def labels = [@label] + @children.flat_map(&:labels)

  def to_s
    return @label.to_s if leaf?

    "#{@label}(#{@children.map(&:to_s).join(' ')})"
  end

  def ==(other) = other.is_a?(Tree) && label == other.label && children == other.children
end

Crumb = Struct.new(:label, :left, :right) do
  def to_s = "#{label}[#{left.size}<>#{right.size}]"
end

class Zipper
  attr_reader :focus, :crumbs

  def self.root(tree) = new(tree, [])

  def initialize(focus, crumbs)
    @focus = focus
    @crumbs = crumbs
  end

  def root? = @crumbs.empty?

  def depth = @crumbs.size

  def down(index = 0)
    kids = @focus.children
    return nil if index.negative? || index >= kids.size

    Zipper.new(kids[index], @crumbs + [Crumb.new(@focus.label, kids[0, index], kids[(index + 1)..])])
  end

  def up
    return nil if root?

    crumb = @crumbs.last
    rebuilt = Tree.new(crumb.label, crumb.left + [@focus] + crumb.right)
    Zipper.new(rebuilt, @crumbs[0...-1])
  end

  def left
    return nil if root? || @crumbs.last.left.empty?

    crumb = @crumbs.last
    sibling = crumb.left.last
    Zipper.new(sibling, @crumbs[0...-1] + [Crumb.new(crumb.label, crumb.left[0...-1], [@focus] + crumb.right)])
  end

  def right
    return nil if root? || @crumbs.last.right.empty?

    crumb = @crumbs.last
    sibling = crumb.right.first
    Zipper.new(sibling, @crumbs[0...-1] + [Crumb.new(crumb.label, crumb.left + [@focus], crumb.right[1..])])
  end

  def top
    cursor = self
    cursor = cursor.up while cursor.crumbs.any?
    cursor
  end

  def tree = top.focus

  def replace(tree) = Zipper.new(tree, @crumbs)

  def edit(&fn) = replace(fn.call(@focus))

  def insert_right(tree)
    return nil if root?

    crumb = @crumbs.last
    Zipper.new(@focus, @crumbs[0...-1] + [Crumb.new(crumb.label, crumb.left, [tree] + crumb.right)])
  end

  def prune
    return nil if root?

    crumb = @crumbs.last
    Zipper.new(Tree.new(crumb.label, crumb.left + crumb.right), @crumbs[0...-1])
  end

  # The route from the root as a list of child indexes.
  def path
    cursor = self
    steps = []
    until cursor.root?
      steps.unshift(cursor.crumbs.last.left.size)
      cursor = cursor.up
    end
    steps
  end

  def follow(steps) = steps.reduce(self) { |z, i| z.nil? ? nil : z.down(i) }

  def to_s = "Zipper(focus=#{@focus.label}, depth=#{depth}, crumbs=#{@crumbs.map(&:to_s).join(',')})"
end

def leaf(label) = Tree.new(label)

TREE = Tree.new("doc", [
                  Tree.new("head", [leaf("title"), leaf("meta")]),
                  Tree.new("body", [
                             Tree.new("section", [leaf("h1"), leaf("p1"), leaf("p2")]),
                             leaf("footer")
                           ])
                ])

puts "== the tree =="
puts TREE.to_s
puts "size #{TREE.size}, depth #{TREE.depth}"
puts "labels in preorder: #{TREE.labels.inspect}"

puts
puts "== walking down and back up =="
z = Zipper.root(TREE)
puts "at the root: #{z}"
section = z.down(1).down(0)
puts "down(1).down(0): #{section}"
puts "its labels: #{section.focus.labels.inspect}"
puts "path from the root: #{section.path.inspect}"
puts "back up twice is the root again: #{section.up.up.focus == TREE}"
puts "top from anywhere: #{section.top.focus == TREE}"

puts
puts "== siblings =="
first_para = section.down(1)
puts "focus: #{first_para.focus.label}"
puts "left:  #{first_para.left.focus.label}"
puts "right: #{first_para.right.focus.label}"
puts "left of the leftmost: #{section.down(0).left.inspect}"
puts "right of the rightmost: #{section.down(2).right.inspect}"
walk = [first_para]
walk << walk.last.right while walk.last.right
puts "walking right to the end: #{walk.map { |w| w.focus.label }.inspect}"

puts
puts "== follow a path, and read it back =="
[[0], [0, 1], [1, 0, 2], [1, 1]].each do |steps|
  landed = Zipper.root(TREE).follow(steps)
  puts format("  %-12s -> %-8s path back: %s",
              steps.inspect, landed.focus.label, landed.path.inspect)
end
puts "a path off the end: #{Zipper.root(TREE).follow([0, 9]).inspect}"

puts
puts "== editing rebuilds only the spine =="
renamed = first_para.replace(leaf("PARAGRAPH")).tree
puts "before: #{TREE}"
puts "after:  #{renamed}"
puts "original untouched: #{TREE.labels.include?('p1')}"
puts "edit reached the root: #{renamed.labels.include?('PARAGRAPH')}"
puts "sizes match: #{renamed.size == TREE.size}"
shared = TREE.children.first.equal?(renamed.children.first)
puts "the untouched head subtree is the same object: #{shared}"

puts
puts "== edit with a block =="
upcased = Zipper.root(TREE).down(1).down(1).edit { |t| Tree.new(t.label.upcase) }.tree
puts "footer upcased: #{upcased}"
grown = Zipper.root(TREE).down(0).edit { |t| Tree.new(t.label, t.children + [leaf("extra")]) }.tree
puts "head grown:     #{grown}"
puts "sizes: #{TREE.size} -> #{grown.size}"

puts
puts "== insert and prune =="
inserted = first_para.insert_right(leaf("p1b")).tree
puts "inserted after p1: #{inserted}"
pruned = first_para.prune.tree
puts "pruned p1:         #{pruned}"
puts "insert grew by one: #{inserted.size == TREE.size + 1}"
puts "prune shrank by one: #{pruned.size == TREE.size - 1}"
puts "prune at the root:  #{Zipper.root(TREE).prune.inspect}"

puts
puts "== a full traversal driven by the zipper =="
def preorder(zipper, seen = [])
  seen << zipper.focus.label
  index = 0
  child = zipper.down(index)
  while child
    preorder(child, seen)
    index += 1
    child = zipper.down(index)
  end
  seen
end
puts "zipper preorder: #{preorder(Zipper.root(TREE)).inspect}"
puts "matches Tree#labels: #{preorder(Zipper.root(TREE)) == TREE.labels}"

leaves = []
stack = [Zipper.root(TREE)]
until stack.empty?
  cursor = stack.pop
  if cursor.focus.leaf?
    leaves << cursor.path
  else
    (cursor.focus.children.size - 1).downto(0) { |i| stack.push(cursor.down(i)) }
  end
end
puts "paths to every leaf: #{leaves.inspect}"
puts "leaf count matches: #{leaves.size == TREE.labels.size - 4}"

puts
puts "== the root has no neighbours =="
r = Zipper.root(TREE)
puts "root?: #{r.root?}, depth #{r.depth}"
puts "up: #{r.up.inspect}, left: #{r.left.inspect}, right: #{r.right.inspect}"
puts "down past the end: #{r.down(2).inspect}, down(-1): #{r.down(-1).inspect}"
puts "a single-node tree: #{Zipper.root(leaf('only')).down(0).inspect}"
puts "path at the root: #{r.path.inspect}"
