# frozen_string_literal: true
# Prefix tree (trie) with a Hash of child nodes.
# Inference: @children is a Hash{String=>Trie} — a recursive user type keyed by
# String — that must be threaded through insert/search/prefix walks.

class Trie
  def initialize
    @children = {}
    @terminal = false
  end

  def insert(word)
    node = self
    word.each_char { |ch| node = node.child(ch) }
    node.mark
    self
  end

  def child(ch)
    @children[ch] ||= Trie.new
  end

  def mark
    @terminal = true
  end

  def include?(word)
    node = self
    word.each_char do |ch|
      nxt = node.lookup(ch)
      return false if nxt.nil?
      node = nxt
    end
    node.terminal?
  end

  def lookup(ch) = @children[ch]
  def terminal? = @terminal

  def count
    total = @terminal ? 1 : 0
    @children.each_value { |c| total += c.count }
    total
  end
end

trie = Trie.new
%w[cat car card care dog do].each { |w| trie.insert(w) }

p trie.include?("car")
p trie.include?("care")
p trie.include?("ca")
p trie.include?("dog")
p trie.include?("dodo")
p trie.count
