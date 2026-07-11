# frozen_string_literal: true
# Kernel#to_enum
e040 = [1, 2, 3].to_enum(:each)
p(e040.next)
p(e040.peek)
p(e040.next)
v040 = [5, 6].to_enum(:each).to_a; p v040
# to_enum over an arbitrary user method (not Array/Range#each) is an external Enumerator:
# 3.to_enum(:times).next    # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# returns self assigns the receiver to an Enumerator pointer; stdout matches but the C
# build warns, so this is kept live and the warning is the divergence
class ToEnumSelf122
  def each
    return to_enum(:each) unless block_given?

    yield 1
    yield 2
    self
  end
end
p ToEnumSelf122.new.each.to_a
v123 = ToEnumSelf122.new.each.to_a; p v123

# has been taken over an Array of the same class
class TeBox950
  include Enumerable
  attr_reader :size
  def initialize(items)
    @items = items
    @size = items.size
  end
  def each
    return to_enum(:each) unless block_given?

    @items.each { |i| yield i }
    self
  end
end
boxes950 = [TeBox950.new([0, 1]), TeBox950.new([0, 1, 4, 9])]
p boxes950.map(&:size)
b951 = boxes950.last
p b951.each.take(3)
v952 = b951.each.take(3); p v952
