# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(1, 2, 3, 4)

# Enumerable#grep
p(Nums.new(1, 2, 3, 4).grep(2..3))

a001 = n
p a001.class
p a001.grep(2..3)

a002 = Nums.new(1, 2, 3, 4)
b002 = (2..3)
p b002.class
p a002.grep(b002)

a003 = Nums.new(1, 2, 3, 4)
b003 = (2..3)
c003 = a003.grep(b003)
p c003.class
p c003

# Enumerable#grep with a block
p(Nums.new(1, 2, 3, 4).grep(2..3) { |x| x * 10 })

a004 = Nums.new(1, 2, 3, 4)
c004 = a004.grep(2..3) { |x| x * 10 }
p c004.class
p c004

# grep with a class pattern over mixed elements
p(Nums.new(1, 1.5, "a", 2).grep(Integer))

a005 = Nums.new(1, 1.5, "a", 2)
c005 = a005.grep(Integer)
p c005.class
p c005

# grep with a Regexp pattern
p(Nums.new("apple", "banana", "cherry").grep(/an/))
a006 = Nums.new("apple", "banana", "cherry"); c006 = a006.grep(/an/); p c006
