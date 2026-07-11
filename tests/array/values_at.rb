# frozen_string_literal: true
# Array#values_at

p([10, 20, 30, 40].values_at(0, 2))

a001 = [10, 20, 30, 40]
p a001.class
p a001.values_at(0, 2)

a002 = [10, 20, 30, 40]
b002 = 0
p b002.class
p a002.values_at(b002, 2)

a003 = [10, 20, 30, 40]
b003 = 0
c003 = a003.values_at(b003, 2)
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4].values_at(0, 2))

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
p a004.values_at(0, 2)

a005 = [1.1, 2.2, 3.3, 4.4]
b005 = 0
p b005.class
p a005.values_at(b005, 2)

a006 = [1.1, 2.2, 3.3, 4.4]
b006 = 0
c006 = a006.values_at(b006, 2)
p c006.class
p c006

p(["a", "b", "c", "d"].values_at(0, 2))

a007 = ["a", "b", "c", "d"]
p a007.class
p a007.values_at(0, 2)

a008 = ["a", "b", "c", "d"]
b008 = 0
p b008.class
p a008.values_at(b008, 2)

a009 = ["a", "b", "c", "d"]
b009 = 0
c009 = a009.values_at(b009, 2)
p c009.class
p c009

# Range argument
p([10, 20, 30, 40, 50].values_at(1..3))
a020 = [10, 20, 30, 40, 50]
c020 = a020.values_at(1..3)
p c020

# negative indices
p([10, 20, 30].values_at(0, -1, -2))
a021 = [10, 20, 30]
c021 = a021.values_at(0, -1, -2)
p c021

# out-of-range -> nil filled
p([1, 2, 3].values_at(1, 5, 2))
a022 = [1, 2, 3]
c022 = a022.values_at(1, 5, 2)
p c022

# no arguments -> []
p([1, 2, 3].values_at)
a023 = [1, 2, 3]
c023 = a023.values_at
p c023

# Array#values_at on an Array read out of a container raises NoMethodError.
zv10 = [["a", "b", "c"]]
zv11 = (zv10[0].values_at(0, 1) rescue $!.class); p zv11
# an Integer inner array is correct
zv12 = [[1, 2, 3]]; p zv12[0].values_at(0, 1)

# Range arguments, mixed with Integers, and out-of-range indices.
p([1, 2, 3, 4, 5].values_at(1..3))
g821 = [1, 2, 3, 4, 5]; p g821.values_at(1..3)
v821 = [1, 2, 3, 4, 5].values_at(1..3); p v821
p([1, 2, 3, 4, 5].values_at(1...3))
v822 = [1, 2, 3, 4, 5].values_at(1...3); p v822
p([1, 2, 3, 4, 5].values_at(0..1, 3..4))
v823 = [1, 2, 3, 4, 5].values_at(0..1, 3..4); p v823
p([1, 2, 3, 4, 5].values_at(3..9))
v824 = [1, 2, 3, 4, 5].values_at(3..9); p v824
p([1, 2, 3, 4, 5].values_at(0, 9))
v825 = [1, 2, 3, 4, 5].values_at(0, 9); p v825
p([1, 2, 3, 4, 5].values_at(-1, -2))
v826 = [1, 2, 3, 4, 5].values_at(-1, -2); p v826
p([1, 2, 3, 4, 5].values_at)
v827 = [1, 2, 3, 4, 5].values_at; p v827
p([1, 2, 3, 4, 5].values_at(2..))
p([1, 2, 3, 4, 5].values_at(..2))
v828 = [1, 2, 3, 4, 5].values_at(0..); p v828
p([1, 2, 3, 4, 5].values_at(0, 2..))

# a Float index truncates in CRuby; Spinel agrees but emits a compile warning
p([1, 2].values_at(1.5))
v829 = [1, 2].values_at(1.5); p v829
p([1, 2, 3].values_at(0.9))
p([1, 2, 3].values_at(-1.5))
p([1, 2, 3].values_at(1.5, 2.5))
p([1, 2, 3].values_at(0, 1.5))
# Control: the same Float value through a local compiles clean — it is the literal that warns.
b830 = 1.5; p([1, 2, 3].values_at(b830))
a831 = [1, 2, 3]; b831 = 1.5; v831 = a831.values_at(b831); p v831

# a String index aborts the C build
r430 = ([1, 2].values_at("x") rescue $!.class); p r430
# a non-Integer index is absorbed instead of raising TypeError
r401 = ([1, 2].values_at(:s) rescue $!.class); p r401
