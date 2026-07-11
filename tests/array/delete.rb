# frozen_string_literal: true
# Array#delete

p([1, 2, 3, 2].delete(2))

a001 = [1, 2, 3, 2]
p a001.class
p a001.delete(2)

a002 = [1, 2, 3, 2]
b002 = 2
p b002.class
p a002.delete(b002)

a003 = [1, 2, 3, 2]
b003 = 2
c003 = a003.delete(b003)
p c003.class
p c003

p([:x, :y, :z, :y].delete(:y))

a004 = [:x, :y, :z, :y]
p a004.class
p a004.delete(:y)

a005 = [:x, :y, :z, :y]
b005 = :y
p b005.class
p a005.delete(b005)

a006 = [:x, :y, :z, :y]
b006 = :y
c006 = a006.delete(b006)
p c006.class
p c006

p(["a", "b", "c", "b"].delete("b"))

a007 = ["a", "b", "c", "b"]
p a007.class
p a007.delete("b")

a008 = ["a", "b", "c", "b"]
b008 = "b"
p b008.class
p a008.delete(b008)

a009 = ["a", "b", "c", "b"]
b009 = "b"
c009 = a009.delete(b009)
p c009.class
p c009

# hits, misses and the not-found block
h521 = [1, 2, 3, 2]
p h521.dup.delete(2)
w521 = [1, 2, 3, 2].delete(2); p w521
h522 = [1, 2, 3, 2]; h522.delete(2); p h522
p([1, 2, 3].delete(9))
p([1, 2, 3].delete(9) { :none })
w523 = [1, 2, 3].delete(9) { :none }; p w523
p(%w[a b a].delete("a"))
h524 = %w[a b a]; h524.delete("a"); p h524
p([].delete(1))
n525 = 2
p([1, 2, 3].delete(n525))
