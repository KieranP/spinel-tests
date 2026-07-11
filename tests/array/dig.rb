# frozen_string_literal: true
# Array#dig

p([[1, [2, 3]]].dig(0, 1, 0))

a001 = [[1, [2, 3]]]
p a001.class
p a001.dig(0, 1, 0)

a002 = [[1, [2, 3]]]
b002 = 0
p b002.class
p a002.dig(b002, 1, 0)

a003 = [[1, [2, 3]]]
b003 = 0
c003 = a003.dig(b003, 1, 0)
p c003.class
p c003

p([[1.1, [2.2, 3.3]]].dig(0, 1, 0))

a004 = [[1.1, [2.2, 3.3]]]
p a004.class
p a004.dig(0, 1, 0)

a005 = [[1.1, [2.2, 3.3]]]
b005 = 0
p b005.class
p a005.dig(b005, 1, 0)

a006 = [[1.1, [2.2, 3.3]]]
b006 = 0
c006 = a006.dig(b006, 1, 0)
p c006.class
p c006

p([["a", ["b", "c"]]].dig(0, 1, 0))

a007 = [["a", ["b", "c"]]]
p a007.class
p a007.dig(0, 1, 0)

a008 = [["a", ["b", "c"]]]
b008 = 0
p b008.class
p a008.dig(b008, 1, 0)

a009 = [["a", ["b", "c"]]]
b009 = 0
c009 = a009.dig(b009, 1, 0)
p c009.class
p c009

# nil intermediate short-circuits to nil
p([[1, 2], nil].dig(1, 0))
a020 = [[1, 2], nil]
c020 = a020.dig(1, 0)
p c020

# out-of-range top index -> nil
p([[1, 2]].dig(5, 0))
a021 = [[1, 2]]
c021 = a021.dig(5, 0)
p c021

# digging into a non-diggable value raises TypeError
r022 = ([[1, 2]].dig(0, 0, 0) rescue $!.class)
p r022

# a non-diggable value at the FIRST level raises TypeError
r024 = ([1].dig(0, 0) rescue $!.class); p r024
r025 = ([1.5].dig(0, 0) rescue $!.class); p r025

# a Data element is not diggable in Ruby either
D026 = Data.define(:v)
r026 = ([D026.new(2)].dig(0, :v) rescue $!.class); p r026
r027 = (D026.new(2).dig(:v) rescue $!.class); p r027

# single index behaves like []
p([10, 20, 30].dig(1))
a023 = [10, 20, 30]
c023 = a023.dig(1)
p c023

# a splatted index list whose receiver is shared with a Hash call site
def dig95(config, keys); config.dig(*keys); end
p(dig95([[1, 2]], [0, 1]))
v95 = dig95({ a: { b: 1 } }, [:a, :b]); p v95

# nested Array-of-Array and Array-of-Hash digs, plus misses
h081 = [[1, [2, 3]], [4, [5, 6]]]
p h081.dig(0)
p h081.dig(0, 1)
p h081.dig(0, 1, 0)
p h081.dig(1, 1, 1)
p h081.dig(5)
p h081.dig(0, 5)
p h081.dig(-1, 0)
w081 = h081.dig(0, 1, 1); p w081
w082 = h081.dig(9, 9); p w082
h083 = [{ a: [10, 20] }, { a: [30] }]
p h083.dig(0, :a, 1)
p h083.dig(1, :a, 0)
p h083.dig(0, :b)
w083 = h083.dig(0, :a, 0); p w083
h084 = [[["deep"]]]
p h084.dig(0, 0, 0)
w084 = h084.dig(0, 0, 0); p w084

# a String index aborts the C build
r422 = ([1, 2].dig("x") rescue $!.class); p r422
# a non-Integer index is absorbed instead of raising TypeError
r409 = ([1, 2].dig(:s) rescue $!.class); p r409
