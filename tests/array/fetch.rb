# frozen_string_literal: true
# Array#fetch

p([10, 20, 30].fetch(1))

a001 = [10, 20, 30]
p a001.class
p a001.fetch(1)

a002 = [10, 20, 30]
b002 = 1
p b002.class
p a002.fetch(b002)

a003 = [10, 20, 30]
b003 = 1
c003 = a003.fetch(b003)
p c003.class
p c003

p(["a", "b", "c"].fetch(1))

a004 = ["a", "b", "c"]
p a004.class
p a004.fetch(1)

a005 = ["a", "b", "c"]
b005 = 1
p b005.class
p a005.fetch(b005)

a006 = ["a", "b", "c"]
b006 = 1
c006 = a006.fetch(b006)
p c006.class
p c006

p([1.1, 2.2, 3.3].fetch(-1))

a007 = [1.1, 2.2, 3.3]
p a007.class
p a007.fetch(-1)

a008 = [1.1, 2.2, 3.3]
b008 = -1
p b008.class
p a008.fetch(b008)

a009 = [1.1, 2.2, 3.3]
b009 = -1
c009 = a009.fetch(b009)
p c009.class
p c009

p([10, 20, 30].fetch(5, "default"))
p([10, 20, 30].fetch(5) { |i| i * 100 })

r001 = ([10, 20, 30].fetch(5) rescue "oob")
p r001

# default-value form
p([1, 2, 3].fetch(10, :default))
a020 = [1, 2, 3]
c020 = a020.fetch(10, :default)
p c020

# block form
p([1, 2, 3].fetch(10) { |i| i * 100 })
a021 = [1, 2, 3]
c021 = a021.fetch(10) { |i| i * 100 }
p c021

# negative out-of-range raises IndexError
r022 = ([1, 2, 3].fetch(-10) rescue $!.class)
p r022

# negative in-range
p([1, 2, 3].fetch(-1))
a023 = [1, 2, 3]
c023 = a023.fetch(-1)
p c023

# A two-element splat drops the default, so the out-of-range fetch raises
# IndexError instead of returning it: Ruby :d.
k096 = [5, :d]
r096 = ([9].fetch(*k096) rescue $!.class); p r096
v096 = ([9].fetch(*k096) rescue $!.class); p v096
# control: the same arguments spread positionally
p([9].fetch(5, :d))

# default value, default block, negative and out-of-range indices
h501 = [1, 2, 3]
p h501.fetch(1)
w501 = h501.fetch(1); p w501
p h501.fetch(-1)
p h501.fetch(10, :dflt)
w502 = h501.fetch(10, :dflt); p w502
p h501.fetch(10) { |i503| i503 * 2 }
w503 = h501.fetch(10) { |i504| i504 * 2 }; p w503
w505 = (h501.fetch(10) rescue $!.class); p w505
w506 = (h501.fetch(-10) rescue $!.class); p w506
n507 = 2
p h501.fetch(n507)
p(%w[a b].fetch(1))
w508 = ([].fetch(0, :none)); p w508

# a String index aborts the C build
r424 = ([1, 2].fetch("x") rescue $!.class); p r424
# a non-Integer index is absorbed instead of raising TypeError
r403 = ([1, 2].fetch(:s) rescue $!.class); p r403
