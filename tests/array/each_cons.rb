# frozen_string_literal: true
# Array#each_cons

p([1, 2, 3, 4].each_cons(2).to_a)

a001 = [1, 2, 3, 4]
p a001.class
p a001.each_cons(2).to_a

a002 = [1, 2, 3, 4]
b002 = 2
p b002.class
p a002.each_cons(b002).to_a

a003 = [1, 2, 3, 4]
b003 = 2
c003 = a003.each_cons(b003).to_a
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].each_cons(2).to_a)

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.each_cons(2).to_a

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 2
p b005.class
p a005.each_cons(b005).to_a

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 2
c006 = a006.each_cons(b006).to_a
p c006.class
p c006

p(["a", "b", "c", "d"].each_cons(2).to_a)

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.each_cons(2).to_a

a008 = ["a", "b", "c", "d"]
b008 = 2
p b008.class
p a008.each_cons(b008).to_a

a009 = ["a", "b", "c", "d"]
b009 = 2
c009 = a009.each_cons(b009).to_a
p c009.class
p c009

codes251 = (0...8).map { |n251| n251 * 2 }
d251 = codes251.each_cons(2).map { |a251, b251| a251 + b251 }
w251 = codes251.last; p d251; p w251

# blockless -> Enumerator, over-long windows, empty receiver
h161 = [1, 2, 3, 4, 5]
p h161.each_cons(2).to_a
w161 = h161.each_cons(2).to_a; p w161
p h161.each_cons(3).to_a
p h161.each_cons(1).to_a
p h161.each_cons(10).to_a
p h161.each_cons(2).class
p h161.each_cons(2).map { |x162, y162| y162 - x162 }
w162 = h161.each_cons(2).map { |x163, y163| y163 - x163 }; p w162
p([].each_cons(2).to_a)
p(%w[a b c].each_cons(2).to_a)
w163 = ([1, 2].each_cons(0).to_a rescue $!.class); p w163
