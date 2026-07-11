# frozen_string_literal: true
# Binary search tree: insert, in-order walk, contains?, height.
# Inference: left/right children are nilable recursive references; the compiler
# must thread the Tree type through the recursion.

class Tree
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(v)
    if v < @value
      @left.nil? ? @left = Tree.new(v) : @left.insert(v)
    else
      @right.nil? ? @right = Tree.new(v) : @right.insert(v)
    end
    self
  end

  def contains?(v)
    return true if v == @value
    if v < @value
      @left.nil? ? false : @left.contains?(v)
    else
      @right.nil? ? false : @right.contains?(v)
    end
  end

  def inorder(acc)
    @left.inorder(acc) unless @left.nil?
    acc << @value
    @right.inorder(acc) unless @right.nil?
    acc
  end

  def height
    lh = @left.nil? ? 0 : @left.height
    rh = @right.nil? ? 0 : @right.height
    1 + (lh > rh ? lh : rh)
  end
end

root = Tree.new(8)
[3, 10, 1, 6, 14, 4, 7, 13].each { |n| root.insert(n) }

p root.inorder([])
p root.contains?(7)
p root.contains?(9)
p root.height
