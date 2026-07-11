# frozen_string_literal: true
class Nums
  include Enumerable
  def initialize(*xs); @xs = xs; end
  def each; @xs.each { |x| yield x }; end
end

n = Nums.new(3, 1, 2)

# Enumerable#detect
p(Nums.new(3, 1, 2).detect { |x| x == 2 })

p n.class
p n.detect { |x| x == 2 }

a001 = Nums.new(3, 1, 2)
c001 = a001.detect { |x| x == 2 }
p c001.class
p c001

p(Nums.new(3.5, 1.5, 2.5).detect { |x| x == 2.5 })

a002 = Nums.new(3.5, 1.5, 2.5)
p a002.class
p a002.detect { |x| x == 2.5 }

a003 = Nums.new(3.5, 1.5, 2.5)
c003 = a003.detect { |x| x == 2.5 }
p c003.class
p c003

p(Nums.new("c", "a", "b").detect { |x| x == "b" })

a004 = Nums.new("c", "a", "b")
p a004.class
p a004.detect { |x| x == "b" }

a005 = Nums.new("c", "a", "b")
c005 = a005.detect { |x| x == "b" }
p c005.class
p c005

# Enumerable#detect with an ifnone proc (invoked when nothing matches)
p(Nums.new(1, 2, 3).detect(-> { :none }) { |x| x > 9 })

a006 = Nums.new(1, 2, 3)
c006 = a006.detect(-> { :none }) { |x| x > 9 }
p c006.class
p c006

# Blockless Enumerable#detect on a user class returns an Enumerator
r401detect = (Nums.new(1, 2, 3).detect.class rescue $!.class); p r401detect
