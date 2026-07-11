# frozen_string_literal: true
# Array#last
p([1, 2, 3].last(2))

a050 = [1, 2, 3]
p a050.class
p a050.last(2)

a051 = [1, 2, 3]
b051 = 2
p b051.class
p a051.last(b051)

a052 = [1, 2, 3]
b052 = 2
c052 = a052.last(b052)
p c052.class
p c052

p([1.1, 2.2, 3.3].last(2))

a053 = [1.1, 2.2, 3.3]
p a053.class
p a053.last(2)

a054 = [1.1, 2.2, 3.3]
b054 = 2
p b054.class
p a054.last(b054)

a055 = [1.1, 2.2, 3.3]
b055 = 2
c055 = a055.last(b055)
p c055.class
p c055

p(["a", "b", "c"].last(2))

a056 = ["a", "b", "c"]
p a056.class
p a056.last(2)

a057 = ["a", "b", "c"]
b057 = 2
p b057.class
p a057.last(b057)

a058 = ["a", "b", "c"]
b058 = 2
c058 = a058.last(b058)
p c058.class
p c058

p([1, 2, 3].last)

a060 = [1, 2, 3]
c060 = a060.last
p c060.class
p c060

p([].last)

c061 = [].last
p c061

p([1, 2, 3].last(0))

a062 = [1, 2, 3]
c062 = a062.last(0)
p c062

p([1, 2].last(5))

a063 = [1, 2]
b063 = 5
c063 = a063.last(b063)
p c063

p([1, 2, 3].last(1))

a064 = [1, 2, 3]
c064 = a064.last(1)
p c064

# Array#last(n) on an Array read out of a container raises NoMethodError.
zl10 = [["a", "b", "c"]]
zl11 = (zl10[0].last(2) rescue $!.class); p zl11
# the no-arg form on the same receiver is correct
p zl10[0].last
# an Integer inner array is correct
zl12 = [[1, 2, 3]]; p zl12[0].last(2)

# Nil-guarding select{}.last inside an iteration block mistypes the result array.
zl20 = [[1, 2], [3, 4]]
zl21 = [0].map { |i| w = zl20.select { |a, _| a > 0 }.last; w ? w[0] : 9 }
p zl21

# the counted form, at and past the length, and on an empty receiver
h221 = [3, 1, 4, 1, 5]
p h221.last(3)
w221 = h221.last(3); p w221
p h221.last(0)
p h221.last(100)
n222 = 2
p h221.last(n222)
w222 = h221.last(n222); p w222
p([].last)
p([].last(2))
p(%w[a b c].last(2))
w223 = %w[a b c].last(2); p w223
w224 = ([1, 2].last(-1) rescue $!.class); p w224
h225 = [[1, 2], [3]]; p h225.last(1)

# a String index aborts the C build
r427 = ([1, 2].last("x") rescue $!.class); p r427
# a non-Integer index is absorbed instead of raising TypeError
r405 = ([1, 2].last(:s) rescue $!.class); p r405
