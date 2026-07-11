# frozen_string_literal: true
# Singly linked list built from a self-referential node class.
# Inference: @next is either a Node or nil, so every traversal must handle the
# nilable recursive field without a runtime type check.

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class List
  def initialize
    @head = nil
    @size = 0
  end

  def push(value)
    node = Node.new(value)
    node.next = @head
    @head = node
    @size += 1
    self
  end

  def to_a
    out = []
    cur = @head
    until cur.nil?
      out << cur.value
      cur = cur.next
    end
    out
  end

  def sum
    total = 0
    cur = @head
    until cur.nil?
      total += cur.value
      cur = cur.next
    end
    total
  end

  attr_reader :size
end

list = List.new
[10, 20, 30, 40].each { |n| list.push(n) }

p list.to_a
p list.sum
p list.size
