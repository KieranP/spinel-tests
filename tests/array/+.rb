# frozen_string_literal: true
# Array#+

p([1, 2] + [3, 4])

a001 = [1, 2]
p a001.class
p(a001 + [3, 4])

a002 = [1, 2]
b002 = [3, 4]
p b002.class
p(a002 + b002)

a003 = [1, 2]
b003 = [3, 4]
c003 = (a003 + b003)
p c003.class
p c003

p([1.1, 2.2] + [3.3, 4.4])

a004 = [1.1, 2.2]
p a004.class
p(a004 + [3.3, 4.4])

a005 = [1.1, 2.2]
b005 = [3.3, 4.4]
p b005.class
p(a005 + b005)

a006 = [1.1, 2.2]
b006 = [3.3, 4.4]
c006 = (a006 + b006)
p c006.class
p c006

p(["a", "b"] + ["c", "d"])

a007 = ["a", "b"]
p a007.class
p(a007 + ["c", "d"])

a008 = ["a", "b"]
b008 = ["c", "d"]
p b008.class
p(a008 + b008)

a009 = ["a", "b"]
b009 = ["c", "d"]
c009 = (a009 + b009)
p c009.class
p c009

# empty-array operands
p([] + [1])
a010 = [] + [1]; p a010
p([1] + [])
a011 = [1] + []; p a011

# mixed-type concat
p([1, 2] + ["a"])
a012 = [1, 2] + ["a"]; p a012

# longer arrays
p([1, 2, 3, 4, 5] + [6, 7, 8, 9, 10])
a013 = [1, 2, 3, 4, 5] + [6, 7, 8, 9, 10]; p a013

# chained +
p([1] + [2] + [3])
a014 = [1] + [2] + [3]; p a014

# self + self
a015 = [1, 2]
p(a015 + a015)
c015 = a015 + a015; p c015

# Struct members holding Arrays of a recursive class, combined with Array#+ inside two
# navigation methods; the tagged call below aborts the C build.
class Tree640
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

  def ==(other) = other.is_a?(Tree640) && label == other.label && children == other.children
end

Crumb640 = Struct.new(:label, :left, :right) do
  def to_s = "#{label}[#{left.size}<>#{right.size}]"
end

class Zipper640
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

    Zipper640.new(kids[index], @crumbs + [Crumb640.new(@focus.label, kids[0, index], kids[(index + 1)..])])
  end

  def up
    return nil if root?

    crumb = @crumbs.last
    rebuilt = Tree640.new(crumb.label, crumb.left + [@focus] + crumb.right)
    Zipper640.new(rebuilt, @crumbs[0...-1])
  end

  def left
    return nil if root? || @crumbs.last.left.empty?

    crumb = @crumbs.last
    sibling = crumb.left.last
    Zipper640.new(sibling, @crumbs[0...-1] + [Crumb640.new(crumb.label, crumb.left[0...-1], [@focus] + crumb.right)])
  end

  def right
    return nil if root? || @crumbs.last.right.empty?

    crumb = @crumbs.last
    sibling = crumb.right.first
    Zipper640.new(sibling, @crumbs[0...-1] + [Crumb640.new(crumb.label, crumb.left + [@focus], crumb.right[1..])])
  end

  def to_s = "Zipper640(focus=#{@focus.label}, depth=#{depth}, crumbs=#{@crumbs.map(&:to_s).join(',')})"
end

def leaf640(label) = Tree640.new(label)

TREE640 = Tree640.new("doc", [
                  Tree640.new("head", [leaf640("title"), leaf640("meta")]),
                  Tree640.new("body", [
                             Tree640.new("section", [leaf640("h1"), leaf640("p1"), leaf640("p2")]),
                             leaf640("footer")
                           ])
                ])
puts Zipper640.root(TREE640).down(1).down(0)
w640 = Zipper640.root(TREE640).down(1).down(0).to_s; p w640
