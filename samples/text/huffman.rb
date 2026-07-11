# frozen_string_literal: true
# Huffman codes: build a code tree from character frequencies, emit code lengths.
# Inference: leaf and internal nodes are distinct classes behind one #freq / #walk
# interface; the priority list of mixed nodes forces polymorphic dispatch.

class Leaf
  attr_reader :freq, :char
  def initialize(char, freq)
    @char = char
    @freq = freq
  end

  def walk(prefix, table)
    table[@char] = prefix.empty? ? "0" : prefix
  end
end

class Branch
  attr_reader :freq
  def initialize(left, right)
    @left = left
    @right = right
    @freq = left.freq + right.freq
  end

  def walk(prefix, table)
    @left.walk(prefix + "0", table)
    @right.walk(prefix + "1", table)
  end
end

def build(freqs)
  nodes = freqs.map { |ch, f| Leaf.new(ch, f) }
  while nodes.length > 1
    nodes.sort_by! { |n| n.freq }
    a = nodes.shift
    b = nodes.shift
    nodes << Branch.new(a, b)
  end
  nodes.first
end

freqs = { "a" => 5, "b" => 9, "c" => 12, "d" => 13, "e" => 16, "f" => 45 }
tree = build(freqs)
table = {}
tree.walk("", table)

table.sort.each { |ch, code| puts "#{ch}: #{code.length}" }
p freqs.sum { |ch, f| f * table[ch].length }
