# frozen_string_literal: true
# Array#product

p [].product([1, 2])
v090 = [].product([1, 2]); p v090

p([1, 2].product([3, 4]))

a001 = [1, 2]
p a001.class
p a001.product([3, 4])

a002 = [1, 2]
b002 = [3, 4]
p b002.class
p a002.product(b002)

a003 = [1, 2]
b003 = [3, 4]
c003 = a003.product(b003)
p c003.class
p c003

p([1.1, 2.2].product([3.3, 4.4]))

a004 = [1.1, 2.2]
p a004.class
p a004.product([3.3, 4.4])

a005 = [1.1, 2.2]
b005 = [3.3, 4.4]
p b005.class
p a005.product(b005)

a006 = [1.1, 2.2]
b006 = [3.3, 4.4]
c006 = a006.product(b006)
p c006.class
p c006

p(["a", "b"].product(["c", "d"]))

a007 = ["a", "b"]
p a007.class
p a007.product(["c", "d"])

a008 = ["a", "b"]
b008 = ["c", "d"]
p b008.class
p a008.product(b008)

a009 = ["a", "b"]
b009 = ["c", "d"]
c009 = a009.product(b009)
p c009.class
p c009

h177 = Hash.new(0); [0].product([0]).each { |k177| h177[k177] += 1 }; p h177[[0, 0]]
p177 = [0].product([0]); q177 = Hash.new(0); p177.each { |k| q177[k] += 1 }; p q177[[0, 0]]

# three-way product
p([1, 2].product([3, 4], [5, 6]))
a020 = [1, 2]
c020 = a020.product([3, 4], [5, 6])
p c020

# empty argument -> []
p([1, 2, 3].product([]))
a021 = [1, 2, 3]
c021 = a021.product([])
p c021

# no arguments -> singletons
p([1, 2, 3].product)
a022 = [1, 2, 3]
c022 = a022.product
p c022

# empty receiver
p([].product([1, 2]))
a023 = []
c023 = a023.product([1, 2])
p c023

# one, several and zero other arrays, plus the block form
g971 = [1, 2]
p g971.product([3, 4])
v971 = g971.product([3, 4]); p v971
p g971.product([3, 4], [5])
v972 = g971.product([3, 4], [5]); p v972
p g971.product
v973 = g971.product; p v973
p g971.product([])
v974 = g971.product([]); p v974
p(g971.product([9]) { |c975| c975 })
p([].product([1, 2]))
p(%w[a b].product([1]))
v976 = %w[a b].product([1]); p v976
g977 = ([1, 2].product(3) rescue $!.class); p g977

# splatting an empty Array held in a local
o619 = []
p([1, 2, 3].product(*o619))
w619 = [1, 2, 3].product(*o619); p w619

# splatting any other Array of Arrays
o623 = [[4, 5]]
p([1, 2, 3].product(*o623))
w623 = [1, 2, 3].product(*o623); p w623
p([1, 2, 3].product(*[[4, 5]]))
